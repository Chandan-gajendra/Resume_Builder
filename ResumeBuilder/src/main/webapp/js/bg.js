document.addEventListener("DOMContentLoaded", () => {
  const randomSeed = Math.floor(Math.random() * 100000000000);
  const randomImageUrl = `https://picsum.photos/1920/1080?random=${randomSeed}`;
  document.body.style.backgroundImage = `url('${randomImageUrl}')`;
  document.body.style.backgroundSize = "cover";
  document.body.style.backgroundPosition = "center";
});
