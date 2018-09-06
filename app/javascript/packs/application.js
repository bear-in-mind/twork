import "bootstrap";
import $ from "jquery";
import '../components/select2';
import "../plugins/flatpickr";
import "../components/addComments";

import { initPlayers } from '../plugins/init_howler';
import { alertFadeOut } from '../components/alert';
import { openCloseDivs } from '../components/buttonupdown';
import { createTalentDropdown } from '../components/createTalentDropdown';
import { submitCompletedFormOnClick } from '../components/submit_completed_form_on_click';


$(function () {
  $('[data-toggle="tooltip"]').tooltip({ boundary: 'viewport' })
})


alertFadeOut();
createTalentDropdown();
openCloseDivs();
initPlayers();
submitCompletedFormOnClick();
