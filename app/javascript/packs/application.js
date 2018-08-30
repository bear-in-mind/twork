import "bootstrap";
import $ from "jquery";
import '../components/select2';

import { initPlayers } from '../plugins/init_howler';


$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

initPlayers();
