# Chat Room

A demo realtime chat app built with Rails, Socket.IO and Redis.

## Setup

Install [Redis][], [Node.js][], [Socket.IO][], [Ruby][] (1.9.3 or 2.0) and [Rails][] (4.0.2).

Then clone this repo and install the required gems & node packages:

    git clone git@github.com:xhh/chat-room.git
    cd chat-room
    bundle install
    cd socket-server
    npm install

Start Redis, for example: `redis-server`

Start the socket server (in the *chat-room/socket-server* directory):

    npm start

Start the Rails app (in the *chat-room* directory):

    rails s

Lastly, open [localhost:3000][] and enjoy!


[Redis]: http://redis.io/
[Node.js]: http://nodejs.org/
[Socket.IO]: http://socket.io/
[Ruby]: https://www.ruby-lang.org/
[Rails]: http://rubyonrails.org/
[localhost:3000]: http://localhost:3000/
