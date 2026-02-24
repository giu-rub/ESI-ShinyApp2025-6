(function () {
  function ready(fn) {
    if (document.readyState !== "loading") fn();
    else document.addEventListener("DOMContentLoaded", fn);
  }

  function initNavHighlight() {
    const navbar = document.querySelector(".navbar.fixed-top");
    const links = Array.from(document.querySelectorAll(".navbar .nav-link"))
      .filter(a => (a.getAttribute("href") || "").startsWith("#"));

    if (!links.length) return;

    // Build targets from navbar links (id + element + link)
    let targets = links
      .map(a => {
        const hash = a.getAttribute("href");
        const id = hash.slice(1);
        const el = document.getElementById(id);
        return el ? { id, el, link: a } : null;
      })
      .filter(Boolean);

    if (!targets.length) return;

    function setActive(id) {
      targets.forEach(t => t.link.classList.toggle("active", t.id === id));
    }

    function computeOffsetsSorted() {
      // Sort by actual position on page, NOT navbar order
      const sorted = targets
        .map(t => ({
          id: t.id,
          link: t.link,
          top: t.el.offsetTop,
          bottom: t.el.offsetTop + t.el.offsetHeight
        }))
        .sort((a, b) => a.top - b.top);

      return sorted;
    }

    let offsets = computeOffsetsSorted();

    function refresh() {
      offsets = computeOffsetsSorted();
      onScroll();
    }

    function onScroll() {
      const navH = navbar ? navbar.offsetHeight : 0;
      const y = window.scrollY + navH + 1;

      // Default to first visible section
      let current = offsets[0].id;

      for (let i = 0; i < offsets.length; i++) {
        const cur = offsets[i];
        const next = offsets[i + 1];

        // Keep active until the next section (by page order) begins
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

    // Shiny content can change heights after load; refresh a couple times
    setTimeout(refresh, 250);
    setTimeout(refresh, 1000);

    onScroll();
  }

  ready(initNavHighlight);
  document.addEventListener("shiny:connected", initNavHighlight);
})();