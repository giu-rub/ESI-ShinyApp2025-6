<script>
  document.addEventListener("mousemove", function (e) {
    document.querySelectorAll(".parallaxit").forEach(card => {
      const rect = card.getBoundingClientRect();
      const x = ((e.clientX - rect.left) / rect.width - 0.5) * 10;
      const y = ((e.clientY - rect.top) / rect.height - 0.5) * 10;
      card.style.transform = `translate(${x}px, ${y}px)`;
    });
  });
</script>
  