document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("open-toolbox-tab");
  if (!btn) return;

  btn.addEventListener("click", function (e) {
    e.preventDefault();

    // open SAME app in a new tab and jump to the toolbox section
    const url = window.location.origin + window.location.pathname + "#transition3-section";
    window.open(url, "_blank", "noopener");
  });
});