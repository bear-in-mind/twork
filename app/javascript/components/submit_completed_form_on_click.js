function submitCompletedFormOnClick() {
  const completedInputs = document.querySelectorAll(".edit_session input[type=checkbox]");
  completedInputs.forEach((completedInput) => {
    completedInput.addEventListener("change", (event) => {
      console.log(event.currentTarget.closest("form"));
      event.currentTarget.closest("form").submit(); // was commented, but should not be

    });
  });

  // const completedLabels = document.querySelectorAll(".completed-label");
  // completedLabels.forEach((completedLabel) => {
  //   completedLabel.addEventListener("click", (event) => {
  //     console.log(event.currentTarget.closest("form"));
  //     // event.currentTarget.closest("form").submit();

  //   });
  // });
}

export { submitCompletedFormOnClick };
