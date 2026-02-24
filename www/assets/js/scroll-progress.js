(function () {
  function ready(fn) {
    if (document.readyState !== "loading") fn();
    else document.addEventListener("DOMContentLoaded", fn);
  }

  function clamp(n, min, max) {
    return Math.min(Math.max(n, min), max);
  }

  function initScrollProgress() {
    const bar = document.querySelector(".scroll-progress-bar");
    const wrap = document.querySelector(".scroll-progress");
    const nav = document.querySelector(".navbar.fixed-top");

    if (!bar || !wrap) return;

    function setTopOffset() {
      const navH = nav ? nav.getBoundingClientRect().height : 0;
      wrap.style.top = navH + "px";
    }

    function update() {
      const doc = document.documentElement;
      const scrollTop = window.scrollY || doc.scrollTop || 0;
      const max = (doc.scrollHeight - window.innerHeight) || 1;
      const pct = clamp((scrollTop / max) * 100, 0, 100);
      bar.style.width = pct + "%";
    }

    // Throttle with rAF for smoothness
    let raf = null;
    function schedule() {
      if (raf) cancelAnimationFrame(raf);
      raf = requestAnimationFrame(() => {
        setTopOffset();
        update();
      });
    }

    // Initial
    setTopOffset();
    update();

    window.addEventListener("scroll", schedule, { passive: true });
    window.addEventListener("resize", schedule);

    // If navbar height changes when toggler opens, update on click too
    document.addEventListener("click", (e) => {
      if (e.target.closest(".navbar")) schedule();
    });
  }

  // Shiny can connect after DOMContentLoaded, so run both
  ready(initScrollProgress);
  document.addEventListener("shiny:connected", initScrollProgress);
})();