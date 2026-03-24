(function () {
  function ready(fn) {
    if (document.readyState !== "loading") {
      fn();
    } else {
      document.addEventListener("DOMContentLoaded", fn);
    }
  }

  ready(function () {
    const ACTIVE_CLASS = "nav-link-underline-active";

    function getScientificLink() {
      return document.querySelector('.navbar .nav-link[href="#transition1-section"]');
    }

    function getEsiLink() {
      return document.getElementById("esiDropdown");
    }

    function getTransition1Section() {
      return document.getElementById("transition1-section");
    }

    function getTransition1cSection() {
      return document.getElementById("transition1c-section");
    }

    function getAbsoluteTop(el) {
      return el.getBoundingClientRect().top + window.scrollY;
    }

    function clearHighlights() {
      const scientificLink = getScientificLink();
      const esiLink = getEsiLink();

      if (scientificLink) scientificLink.classList.remove(ACTIVE_CLASS);
      if (esiLink) esiLink.classList.remove(ACTIVE_CLASS);
    }

    function updateNavbarHighlight() {
      const scientificLink = getScientificLink();
      const esiLink = getEsiLink();
      const transition1Section = getTransition1Section();
      const transition1cSection = getTransition1cSection();
      const navbar = document.querySelector(".navbar");

      clearHighlights();

      if (!navbar) return;

      const triggerLine = window.scrollY + navbar.offsetHeight + 20;

      const transition1Top = transition1Section ? getAbsoluteTop(transition1Section) : Infinity;
      const transition1cTop = transition1cSection ? getAbsoluteTop(transition1cSection) : Infinity;

      if (triggerLine >= transition1cTop) {
        if (esiLink) esiLink.classList.add(ACTIVE_CLASS);
        return;
      }

      if (triggerLine >= transition1Top) {
        if (scientificLink) scientificLink.classList.add(ACTIVE_CLASS);
      }
    }

    let ticking = false;

    function requestUpdate() {
      if (!ticking) {
        window.requestAnimationFrame(function () {
          updateNavbarHighlight();
          ticking = false;
        });
        ticking = true;
      }
    }

    window.addEventListener("scroll", requestUpdate, { passive: true });
    window.addEventListener("resize", requestUpdate);
    window.addEventListener("load", requestUpdate);

    setTimeout(updateNavbarHighlight, 100);
    setTimeout(updateNavbarHighlight, 500);
    setTimeout(updateNavbarHighlight, 1000);

    updateNavbarHighlight();
  });
})();

