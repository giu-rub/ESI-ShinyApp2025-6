// Observe which .story-step is most visible within each .storymap-root,
// add .is-active, and notify Shiny via namespaced input "<ns>current_step".
// Works with multiple instances because it reads data-ns from each root.

(function () {
  function ready(fn) {
    if (document.readyState !== 'loading') fn();
    else document.addEventListener('DOMContentLoaded', fn);
  }

  ready(function () {
    const roots = document.querySelectorAll('.storymap-root');
    if (!roots.length) return;

    roots.forEach(root => {
      const ns = root.getAttribute('data-ns') || '';      // e.g., "sm-"
      const column = root.querySelector('.story-column');
      const steps  = root.querySelectorAll('.story-step');
      if (!column || !steps.length) return;

      const activate = (el) => {
        steps.forEach(s => s.classList.remove('is-active'));
        el.classList.add('is-active');
        const id = el.getAttribute('data-step');
        if (window.Shiny && id) {
          Shiny.setInputValue(ns + 'current_step', id, { priority: 'event' });
        }
      };

      const thresholds = Array.from({ length: 11 }, (_, i) => i / 10);
      const observer = new IntersectionObserver((entries) => {
        let best = null;
        for (const e of entries) {
          if (e.isIntersecting && (!best || e.intersectionRatio > best.intersectionRatio)) {
            best = e;
          }
        }
        if (best) activate(best.target);
      }, {
        root: column,
        rootMargin: '0px 0px -20% 0px',
        threshold: thresholds
      });

      steps.forEach(step => observer.observe(step));
      // Initial activation
      activate(steps[0]);
    });
  });
})();
