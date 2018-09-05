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
    selectList.id = "talents_dropdown";
    console.log(skillsDropdown);
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
