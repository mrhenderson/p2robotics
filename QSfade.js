let five = require("johnny-five");
// let board = new five.Board({
//   port: "/dev/ttyACM0"
// });
let board = new five.Board();
board.on("ready", function() {
// Create a standard `led` component instance
 let led = new five.Led(11);
 function fadeIt(){
  led.fadeIn();

  setTimeout(function() {
   led.fadeOut();
  },5000);
}

// on-off phase periods
// led.blink(500);
  this.repl.inject({
    // Allow limited on/off control access to the
    // Led instance from the REPL.
    on: function() {
      led.on();
    },
    off: function() {
      led.off();
    },
    hi: function() {
      console.log("Hello");
    },
    fadeit: function() {
	fadeIt();
    }
  });
});
