function submitCompletedFormOnClick() {
  const completedInputs = document.querySelectorAll(".edit_session input[type=checkbox]");
  completedInputs.forEach((completedInput) => {
    completedInput.addEventListener("change", (event) => {
      // console.log(event.currentTarget.closest("form"));
      const label = document.querySelector("#" + event.currentTarget.closest("form").id + " label")
      const sessionId = label.dataset.session;
      if (label.innerHTML === "Completed") {
        label.innerHTML = "In Progress";
      } else {
        label.innerHTML = "Completed";
      }
      const buttonId = "submit-" + sessionId;
      document.getElementById(buttonId).click();
      // event.currentTarget.closest("form").submit(); // was commented, but should not be
    });
  });
}

export { submitCompletedFormOnClick };
