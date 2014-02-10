var io = require('socket.io').listen(3100);
var redis = require('redis').createClient();

redis.subscribe('chat-room');

io.on('connection', function(socket){
  redis.on('message', function(channel, raw_payload){
    var payload = JSON.parse(raw_payload);
    socket.emit('chat-room/' + payload.room, payload);
  });
});
