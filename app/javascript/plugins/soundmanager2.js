import SoundManager2 from 'soundmanager2';

// function initPlayer() {
//   const scPlayer = new SoundCloudAudio();
//   scPlayer.play({streamUrl: 'https://res.cloudinary.com/twerk/video/upload/v1535531527/audio/Dark_Wagon.m4a'});
// }

function initPlayer() {
  soundManager.setup({

    preferFlash: false,
    onready: function() {

      // SM2 has started - now you can create and play sounds!
      var mySound = soundManager.createSound({
        id: 'aSound', // optional: provide your own unique id
        url: 'https://res.cloudinary.com/twerk/video/upload/v1535531527/audio/Dark_Wagon.m4a'
        // onload: function() { console.log('sound loaded!', this); }
        // other options here..
      });

      mySound.play();
      console.log("Playing requested url")

    },

    // optional: ontimeout() callback for handling start-up failure

    ontimeout: function() {

      // Hrmm, SM2 could not start. Missing SWF? Flash blocked? No HTML5 audio support? Show an error, etc.?
      // See the flashblock demo when you want to start getting fancy.

    }

  });

}

export { initPlayer };
