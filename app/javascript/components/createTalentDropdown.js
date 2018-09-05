function createTalentDropdown() {
  const firstDropdown = document.getElementById('session_talent');
  // console.log(firstDropdown)
  const talentsHash = JSON.parse(document.getElementById('talentsHash').dataset.id);
  const skillsDropdown = document.getElementById('skills_dropdown');

  // console.log(talentsHash)

  firstDropdown.addEventListener('change', (event) => {
    const selectedUser = firstDropdown.value;
    const userTalents = talentsHash[selectedUser];
    const selectList = document.createElement("select");
    const skillLabel = document.createElement("label");
    skillLabel.innerText = "Choose a skill: "
    skillLabel.id = "skill-label"
    skillLabel.classList.add("form-control-label", "select", "optional")
    selectList.classList.add("form-control", "select", "required");
    selectList.name = "skill_id"
    skillsDropdown.appendChild(skillLabel);
    skillsDropdown.appendChild(selectList);
    //Create and append the options
    for (let i = 0; i < userTalents.length; i++) {
        const option = document.createElement("option");
        option.value = userTalents[i][1];
        option.text = userTalents[i][0];
        selectList.appendChild(option);
    }
  })


  //Create and append select list
}

export {createTalentDropdown};
