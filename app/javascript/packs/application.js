import "bootstrap";
import $ from "jquery";
import '../components/select2';
import "../plugins/flatpickr"

import { initPlayers } from '../plugins/init_howler';
import { alertFadeOut } from '../components/alert';

$(function () {
  $('[data-toggle="tooltip"]').tooltip({ boundary: 'viewport' })
})

initPlayers();

alertFadeOut();
