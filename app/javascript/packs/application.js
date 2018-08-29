import "bootstrap";
import $ from "jquery";

import { initPlayer } from '../plugins/init_howler';


let session_tracks = [
    {
      title: 'Dark Wagon - Basic Track',
      howl: null,
      url: 'https://res.cloudinary.com/twerk/video/upload/v1535531527/audio/Dark_Wagon.m4a'
    },
    {
      title: 'Luce - Basse/Batt',
      howl: null,
      url: 'https://res.cloudinary.com/twerk/video/upload/v1535539370/audio/Ciao_BASS-BATT-RHODES.mp3'
    },
];

initPlayer(session_tracks);

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
