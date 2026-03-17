

(function () {
  function ready(fn) {
    if (document.readyState !== "loading") fn();
    else document.addEventListener("DOMContentLoaded", fn);
  }

  function initNavHighlight() {
    const navbar = document.querySelector(".navbar.fixed-top");

    // Include BOTH top-level nav links and dropdown items that point to #ids
    const links = Array.from(
      document.querySelectorAll(".navbar a.nav-link, .navbar .dropdown-menu a.dropdown-item")
    ).filter(a => (a.getAttribute("href") || "").startsWith("#"));

    if (!links.length) return;

    // Build targets from links -> { id, el, link }
    const targets = links
      .map(a => {
        const hash = a.getAttribute("href");
        const id = hash.slice(1);
        const el = document.getElementById(id);
        return el ? { id, el, link: a } : null;
      })
      .filter(Boolean);

    if (!targets.length) return;

    function setActive(id) {
      // Clear all active states first
      targets.forEach(t => t.link.classList.toggle("active", t.id === id));

      // NEW: bubble active state up to dropdown toggles
      document.querySelectorAll(".navbar .dropdown").forEach(drop => {
        const toggle = drop.querySelector(".nav-link.dropdown-toggle");
        const anyActiveItem = drop.querySelector(".dropdown-menu .dropdown-item.active");
        if (toggle) toggle.classList.toggle("active", !!anyActiveItem);
      });
    }

    function computeOffsetsSorted() {
      return targets
        .map(t => ({
          id: t.id,
          link: t.link,
          top: t.el.offsetTop,
          bottom: t.el.offsetTop + t.el.offsetHeight
        }))
        .sort((a, b) => a.top - b.top);
    }

    let offsets = computeOffsetsSorted();

    function refresh() {
      offsets = computeOffsetsSorted();
      onScroll();
    }

    function onScroll() {
      const navH = navbar ? navbar.offsetHeight : 0;
      const y = window.scrollY + navH + 1;

      let current = offsets[0].id;

      for (let i = 0; i < offsets.length; i++) {
        const cur = offsets[i];
        const next = offsets[i + 1];

        const start = cur.top;
        const end = next ? next.top : cur.bottom;

        if (y >= start && y < end) {
          current = cur.id;
          break;
        }
      }

      setActive(current);
    }

    window.addEventListener("scroll", onScroll, { passive: true });
    window.addEventListener("resize", refresh);
    window.addEventListener("load", refresh);

    setTimeout(refresh, 250);
    setTimeout(refresh, 1000);

    onScroll();
  }

  ready(initNavHighlight);
  document.addEventListener("shiny:connected", initNavHighlight);
})();