(function () {
  function ready(fn) {
    if (document.readyState !== "loading") fn();
    else document.addEventListener("DOMContentLoaded", fn);
  }

  function initNavHighlight() {
    const navbar = document.querySelector(".navbar.fixed-top");

    const links = Array.from(
      document.querySelectorAll(".navbar a.nav-link, .navbar .dropdown-menu a.dropdown-item")
    ).filter(a => {
      const href = a.getAttribute("href") || "";
      return href.includes("#");
    });

    if (!links.length) return;

    const targets = links
      .map(a => {
        const href = a.getAttribute("href") || "";
        const hashIndex = href.indexOf("#");
        if (hashIndex === -1) return null;

        const id = href.slice(hashIndex + 1);
        const el = document.getElementById(id);

        return el ? { id, el, link: a } : null;
      })
      .filter(Boolean);

    if (!targets.length) return;

    function clearActive() {
      targets.forEach(t => t.link.classList.remove("active"));
      document.querySelectorAll(".navbar .dropdown").forEach(drop => {
        const toggle = drop.querySelector(".nav-link.dropdown-toggle");
        if (toggle) toggle.classList.remove("active");
      });
    }

    function setActive(id) {
      targets.forEach(t => {
        t.link.classList.toggle("active", t.id === id);
      });

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
      if (!offsets.length) return;

      const navH = navbar ? navbar.offsetHeight : 0;
      const y = window.scrollY + navH + 1;

      // Before first tracked section: nothing active
      if (y < offsets[0].top) {
        clearActive();
        return;
      }

      let current = null;

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

      if (current) setActive(current);
      else clearActive();
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