import "bootstrap";
import $ from "jquery";
import '../components/select2';
import "../plugins/flatpickr"

import { initPlayer } from '../plugins/init_howler';


$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

initPlayer();

flatpickr(".datepicker", {});
