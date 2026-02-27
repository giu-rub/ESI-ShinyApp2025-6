function initTeamParallax() {
  document.querySelectorAll(".parallaxit").forEach(card => {
    card.style.transform = "none";   // remove any inline translate
  });
}

document.addEventListener("DOMContentLoaded", initTeamParallax);
document.addEventListener("shiny:connected", initTeamParallax);