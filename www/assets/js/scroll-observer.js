// Simple, robust centerline step picker.
// Uses a safe sender wrapper (waits for Shiny; falls back if needed).
// Logs to console and forces 'intro' when at the very top.

(function () {
  function ready(fn){
    if (document.readyState !== 'loading') fn();
    else document.addEventListener('DOMContentLoaded', fn);
  }

  // ---- NEW: safe sender wrapper ----
  function sendStep(ns, id){
    if (!id) return;
    // wait until Shiny is ready
    if (!window.Shiny) { setTimeout(() => sendStep(ns, id), 50); return; }
    if (typeof Shiny.setInputValue === 'function') {
      Shiny.setInputValue(ns + 'current_step', id, { priority: 'event' });
    } else if (typeof Shiny.onInputChange === 'function') {
      Shiny.onInputChange(ns + 'current_step', id);
    }
    console.log('[storymap]', ns + 'current_step =', id);
  }

  // Wait until the steps exist (Shiny can render after DOMContentLoaded)
  function waitForSteps(root, tries=0){
    const steps = root.querySelectorAll('.story-step');
    if (steps.length) return steps;
    if (tries > 50) return steps; // give up after ~1s
    return setTimeout(() => waitForSteps(root, tries+1), 20);
  }

  function initRoot(root){
    const ns = root.getAttribute('data-ns') || '';
    let steps = root.querySelectorAll('.story-step');
    if (!steps.length) {
      // try delayed fetch if not yet in DOM
      const t = waitForSteps(root);
      if (!t || !t.length) return;
      steps = t;
    }
    steps = Array.from(steps);

    const state = { id: null, raf: null };
    const HYST = 12; // px

    function activate(el){
      steps.forEach(s => s.classList.remove('is-active'));
      el.classList.add('is-active');
      const id = el.getAttribute('data-step');
      if (id && id !== state.id) {
        state.id = id;
        sendStep(ns, id); // <-- use wrapper
      }
    }

    function pick(){
      // Force intro at the top
      if (window.scrollY <= 1) { activate(steps[0]); return; }

      const centerY = window.innerHeight / 2;

      let best = null, bestDist = Infinity;
      const visible = steps.filter(s => {
        const r = s.getBoundingClientRect();
        return r.bottom > 0 && r.top < window.innerHeight;
      });

      const candidates = visible.length ? visible : steps;

      for (const s of candidates){
        const r = s.getBoundingClientRect();
        const dist = Math.abs((r.top + r.height/2) - centerY);
        if (dist < bestDist){ bestDist = dist; best = s; }
      }
      if (!best) return;

      if (state.id){
        const cur = steps.find(s => s.getAttribute('data-step') === state.id);
        if (cur){
          const r = cur.getBoundingClientRect();
          const curDist = Math.abs((r.top + r.height/2) - centerY);
          if (bestDist >= curDist - HYST) return; // keep current to avoid flip-flop
        }
      }
      activate(best);
    }

    function schedule(){
      if (state.raf) cancelAnimationFrame(state.raf);
      state.raf = requestAnimationFrame(pick);
    }

    window.addEventListener('scroll', schedule, {passive:true});
    window.addEventListener('resize', schedule);

    // Initial selection after layout
    requestAnimationFrame(() => { activate(steps[0]); pick(); });
  }

  function boot(){
    console.log('[storymap] scroll-observer.js loaded');
    const roots = document.querySelectorAll('.storymap-root');
    if (!roots.length) {
      console.warn('[storymap] no .storymap-root found');
      return;
    }
    roots.forEach(initRoot);
  }

  // Ensure we try after DOM ready and after Shiny connects
  document.addEventListener('shiny:connected', boot);
  ready(boot);
})();
