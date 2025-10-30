// Global scrollytelling manager across multiple modules
// - Centerline step picking with hysteresis
// - Sends current_step to the nearest .storymap-root namespace
// - Cross-fades .sticky-pane by matching step's data-pane
// - Start only after small scroll; hide again when user scrolls back up
(function () {
  function ready(fn){
    if (document.readyState !== 'loading') fn();
    else document.addEventListener('DOMContentLoaded', fn);
  }

  function sendStep(ns, id){
    if (!id) return;
    if (!window.Shiny) { setTimeout(() => sendStep(ns, id), 50); return; }
    if (typeof Shiny.setInputValue === 'function') {
      Shiny.setInputValue(ns + 'current_step', id, { priority: 'event' });
    } else if (typeof Shiny.onInputChange === 'function') {
      Shiny.onInputChange(ns + 'current_step', id);
    }
  }

  function nearestRootNs(el){
    const root = el.closest('.storymap-root');
    return root ? (root.getAttribute('data-ns') || '') : '';
  }

  function collectAll(){
    const steps = Array.from(document.querySelectorAll('.story-step'));
    const panes = Array.from(document.querySelectorAll('.sticky-pane'));
    return { steps, panes };
  }

  function bootGlobal(){
    const { steps, panes } = collectAll();
    if (!steps.length) { console.warn('[storymap] no .story-step found'); return; }

    const state = { id: null, raf: null, started: false };
    const HYST = 12;             // step switch stickiness
    const START_SCROLL = 350;     // turns ON once you scroll DOWN past this
    const UNSTART_SCROLL = 900;   // turns OFF once you scroll UP above this

    function setActivePane(paneId){
      // NEW: explicit "off" handling to untrigger everything
      if (paneId === 'off' || paneId === 'none' || paneId === '0') {
        panes.forEach(p => p.classList.remove('is-active'));
        if (window.Shiny) {
          if (typeof Shiny.setInputValue === 'function') {
            Shiny.setInputValue('current_pane', null, {priority:'event'});
          } else if (typeof Shiny.onInputChange === 'function') {
            Shiny.onInputChange('current_pane', null);
          }
        }
        return;
      }

      //Activate matching pane, deactivate others
      panes.forEach(p => {
        const pid = p.getAttribute('data-pane');
        if (pid === paneId) p.classList.add('is-active');
        else p.classList.remove('is-active');
      });
      if (window.Shiny) {
        if (typeof Shiny.setInputValue === 'function') {
          Shiny.setInputValue('current_pane', paneId, {priority:'event'});
        } else if (typeof Shiny.onInputChange === 'function') {
          Shiny.onInputChange('current_pane', paneId);
        }
      }
    }

    function clearActive(){
      // remove active step and hide all panes
      steps.forEach(s => s.classList.remove('is-active'));
      panes.forEach(p => p.classList.remove('is-active'));
      state.id = null;
    }

    function activate(el){
      steps.forEach(s => s.classList.remove('is-active'));
      el.classList.add('is-active');

      const id = el.getAttribute('data-step');
      const paneId = el.getAttribute('data-pane') || '1';

      if (id && id !== state.id) {
        state.id = id;
        const ns = nearestRootNs(el);
        sendStep(ns, id);
        setActivePane(paneId);   // will also handle 'off' to clear panes
      }
    }

    function pick(){
      // Turn OFF earlier on the way up
      if (state.started && window.scrollY <= UNSTART_SCROLL) {
        clearActive();
        state.started = false;
        return;
      }

      // Not started yet? Only start once we pass START_SCROLL
      if (!state.started) {
        if (window.scrollY <= START_SCROLL) return; // keep hidden
        state.started = true; // begin normal picking
      }

      let best = null, bestDist = Infinity;

      const visible = steps.filter(s => {
        const r = s.getBoundingClientRect();
        return r.bottom > 0 && r.top < window.innerHeight;
      });
      const candidates = visible.length ? visible : steps;

      // -------- NEW: per-step activation anchor + offset support --------
      for (const s of candidates){
        const r = s.getBoundingClientRect();

        // anchor: top | center (default) | bottom
        const mode = (s.getAttribute('data-activate-anchor') || 'center').toLowerCase();
        const stepAnchor = mode === 'top'    ? r.top
                          : mode === 'bottom' ? r.bottom
                          : (r.top + r.height / 2);

        const fracAttr = parseFloat(s.getAttribute('data-activate-frac'));
        const frac     = Number.isFinite(fracAttr) ? fracAttr : 0.5; // default 50%
        const offset   = parseFloat(s.getAttribute('data-activate-offset')) || 0;

        const viewportAnchor = (window.innerHeight * Math.min(Math.max(frac, 0), 1)) + offset;

        const dist = Math.abs(stepAnchor - viewportAnchor);
        if (dist < bestDist){ bestDist = dist; best = s; }
      }
      if (!best) return;

      // Hysteresis check uses the same anchor/offset logic
      if (state.id){
        const cur = steps.find(s => s.getAttribute('data-step') === state.id);
        if (cur){
          const r = cur.getBoundingClientRect();

          const mode = (cur.getAttribute('data-activate-anchor') || 'center').toLowerCase();
          const stepAnchor = mode === 'top' ? r.top
                            : mode === 'bottom' ? r.bottom
                            : (r.top + r.height / 2);

          const fracAttr = parseFloat(cur.getAttribute('data-activate-frac'));
          const frac     = Number.isFinite(fracAttr) ? fracAttr : 0.5;
          const offset   = parseFloat(cur.getAttribute('data-activate-offset')) || 0;

          const viewportAnchor = (window.innerHeight * Math.min(Math.max(frac, 0), 1)) + offset;

          const curDist = Math.abs(stepAnchor - viewportAnchor);
          if (bestDist >= curDist - HYST) return; // keep current
        }
      }
      activate(best);
    }

    function schedule(){
      if (state.raf) cancelAnimationFrame(state.raf);
      state.raf = requestAnimationFrame(pick);
    }

    // --- Make Pane 2 fall behind Transition 2 when Transition 2 is in view ---
    const pane2 = document.querySelector('.sticky-pane[data-pane="2"]');
    const transition2 = document.querySelector('.transition2-banner'); // adjust if needed

    if (pane2 && transition2 && 'IntersectionObserver' in window) {
      const io = new IntersectionObserver((entries) => {
        for (const e of entries) {
          if (e.isIntersecting) {
            pane2.classList.add('under-transition2');
          } else {
            pane2.classList.remove('under-transition2');
          }
        }
      }, {
        root: null,
        threshold: 0,
        // Drop Pane 2 behind a bit before Transition 2 touches the viewport
        rootMargin: '10% 0px 10% 0px'
      });

      io.observe(transition2);
    }

    window.addEventListener('scroll', schedule, {passive:true});
    window.addEventListener('resize', schedule);

    // Initial pass: do nothing until user scrolls past START_SCROLL.
    requestAnimationFrame(pick);
  }

  function boot(){ bootGlobal(); }
  document.addEventListener('shiny:connected', boot);
  ready(boot);
})();
