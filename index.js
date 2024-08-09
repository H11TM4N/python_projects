var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  if (n > slides.length) { slideIndex = 1 }
  if (n < 1) { slideIndex = slides.length }
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slides[slideIndex - 1].style.display = "block";
}

// Touch events for sliding
var startX;

document.querySelector('.slideshow-container').addEventListener('touchstart', function(e) {
  startX = e.touches[0].clientX;
});

document.querySelector('.slideshow-container').addEventListener('touchend', function(e) {
  var endX = e.changedTouches[0].clientX;
  if (startX > endX + 30) {
    plusSlides(1); // Slide left
  } else if (startX < endX - 30) {
    plusSlides(-1); // Slide right
  }
});
