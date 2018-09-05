import 'howler';

function moveCursor() {
  const times = document.querySelectorAll(".comment-time");
  if (times) {
    times.forEach((time) => {
      time.addEventListener('click', () => {
        console.log(time.dataset.trackId)
        seek(time.dataset.trackId)
      })
    })
  }
}

export { moveCursor };

