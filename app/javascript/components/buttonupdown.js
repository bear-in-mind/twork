function openCloseDivs() {
  const sessionInstances = document.querySelectorAll(".session-instances");
  if (sessionInstances) {
    sessionInstances.forEach((session) => {
      openCloseDiv(session.dataset.id);
    })
  }
}

function getCurrentAudiofile(x) {
  let audioid = document.getElementById(`track_${x}`);
  return audioid.innerHTML;
}

function openCloseDiv(sessionId) {
  $(document).ready(function() {
   // Hide the div
    $(`.rv_button-${sessionId}`).click(function(e){
      e.preventDefault();
      let audiofilename = getCurrentAudiofile(sessionId).replace(/ /g, '');
      let divtohideshow = document.getElementById(`reveal-${audiofilename}`);
      $(divtohideshow).slideToggle();
      $(`.rv_button-${sessionId}`).toggleClass('opened closed');
      $(`.hidden-comments-${sessionId}, .comments-displayed-${sessionId}`).toggleClass('hidden')
    });
  });
}

export { openCloseDivs };


