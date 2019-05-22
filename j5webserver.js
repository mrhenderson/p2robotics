var http = require('http').createServer(handler); //require http server, and create server with function handler()
var fs = require('fs'); //require filesystem module
var io = require('socket.io')(http) //require socket.io module and pass the http object (server)
var five = require("johnny-five");
var board = new five.Board();
//var Gpio = require('onoff').Gpio; //include onoff to interact with the GPIO
//var pushButton = new Gpio(2, 'in', 'both'); //use GPIO pin 17 as input, and 'both' button presses, and releases should be handled
  http.listen(8080); //listen to port 8080

  function handler (req, res) { //create server
    fs.readFile(__dirname + '/public/index.html', function(err, data) { //read file index.html in public folder
      if (err) {
        res.writeHead(404, {'Content-Type': 'text/html'}); //display 404 on error
        return res.end("404 Not Found");
      }
      res.writeHead(200, {'Content-Type': 'text/html'}); //write HTML
      res.write(data); //write data from index.html
      return res.end();
    });
  }

  board.on("ready", function() {
    var led = new five.Led(11); //Gpio(11, 'out'); //use GPIO pin 4 as output

  io.sockets.on('connection', function (socket) {// WebSocket Connection
    console.log("Connected to Websocket on port 8080");
    socket.on('light', function(data) { //get light switch status from client
      console.log("Switch has been switched" + data);
      led.toggle();

    });
  });

  process.on('SIGINT', function () { //on ctrl+c
    led.off();
    console.log("Turning it off");
    process.exit(); //exit completely
  });
});
