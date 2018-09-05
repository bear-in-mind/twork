function openCloseDivs() {
  const sessionInstances = document.querySelectorAll(".session-instances");
  if (sessionInstances) {
    sessionInstances.forEach((session) => {
      console.log(session.dataset.id);
      openCloseDiv(session.dataset.id);
    })
  }
}


function openCloseDiv(sessionId) {
   $(document).ready(function() {
   // Hide the div
//    $(`#reveal-${sessionId}`).hide();
    $(`.rv_button-${sessionId}`).click(function(e){
      e.preventDefault();
      $(`#reveal-${sessionId}`).slideToggle();
      $(`.rv_button-${sessionId}`).toggleClass('opened closed');
      $(`.hidden-comments-${sessionId}, .comments-displayed-${sessionId}`).toggleClass('hidden')
    });
  });
}

export { openCloseDivs };

