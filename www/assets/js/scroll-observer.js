// Stable scrollytelling activator:
// - Chooses the .story-step whose CENTER is closest to the column's CENTER
// - Small hysteresis avoids ping-pong switching
// - Namespaced input: "<ns>current_step"
// - Works with multiple .storymap-root instances

(function () {
  function ready(fn) {
    if (document.readyState !== 'loading') fn();
    else document.addEventListener('DOMContentLoaded', fn);
  }

  ready(function () {
    const roots = document.querySelectorAll('.storymap-root');
    if (!roots.length) return;

    roots.forEach(root => {
      const ns = root.getAttribute('data-ns') || '';           // e.g., "sm-"
      const column = root.querySelector('.story-column');
      const steps  = Array.from(root.querySelectorAll('.story-step'));
      if (!column || !steps.length) return;

      const state = { id: null, rafId: null };
      const HYSTERESIS_PX = 12; // new step must be this many px closer to center than current

      const activate = (el) => {
        steps.forEach(s => s.classList.remove('is-active'));
        el.classList.add('is-active');
        const id = el.getAttribute('data-step');
        if (id && id !== state.id) {
          state.id = id;
          if (window.Shiny) {
            Shiny.setInputValue(ns + 'current_step', id, { priority: 'event' });
          }
        }
      };

      // Is element vertically overlapping the column viewport?
      const overlapsColumn = (rect, colRect) => rect.bottom > colRect.top && rect.top < colRect.bottom;

      function pickClosestToCenter() {
        const colRect  = column.getBoundingClientRect();
        const centerY  = colRect.top + colRect.height / 2;

        let bestEl = null, bestDist = Infinity;

        // Consider only steps that overlap the column viewport; if none overlap, we’ll fall back to nearest by distance
        const candidates = steps.filter(step => overlapsColumn(step.getBoundingClientRect(), colRect)) || steps;

        for (const step of (candidates.length ? candidates : steps)) {
          const r = step.getBoundingClientRect();
          const stepCenter = r.top + r.height / 2;
          const dist = Math.abs(stepCenter - centerY);
          if (dist < bestDist) { bestDist = dist; bestEl = step; }
        }

        if (!bestEl) return;

        // Hysteresis: only switch if the new candidate is clearly closer than the current one
        if (state.id) {
          const currentEl = steps.find(s => s.getAttribute('data-step') === state.id);
          if (currentEl) {
            const cr = currentEl.getBoundingClientRect();
            const currentDist = Math.abs((cr.top + cr.height / 2) - centerY);
            if (bestDist >= currentDist - HYSTERESIS_PX) {
              return; // keep current selection to avoid flapping
            }
          }
        }

        activate(bestEl);
      }

      function schedulePick() {
        if (state.rafId) cancelAnimationFrame(state.rafId);
        state.rafId = requestAnimationFrame(pickClosestToCenter);
      }

      // Scroll + resize handlers
      column.addEventListener('scroll', schedulePick, { passive: true });
      window.addEventListener('resize', schedulePick);

      // Initial activation (after layout settles)
      requestAnimationFrame(() => {
        // If first step is visible, mark it active immediately for styling, then compute properly
        activate(steps[0]);
        pickClosestToCenter();
      });
    });
  });
})();
