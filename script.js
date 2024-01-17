let currentIndex = 0;

function changePhoto(n) {
  currentIndex += n;
  showPhoto(currentIndex);
}

function showPhoto(index) {
  const gallery = document.querySelector('.gallery');
  const photos = gallery.getElementsByTagName('img');
  
  if (index < 0) {
    currentIndex = photos.length - 1;
  } else if (index >= photos.length) {
    currentIndex = 0;
  }

  const translateValue = -currentIndex * 100 + '%';
  gallery.style.transform = 'translateX(' + translateValue + ')';
}

// Optional: Automatically advance to the next photo every few seconds
// setInterval(function() {
//   changePhoto(1);
// }, 5000);
    