RoomsController = Paloma.controller('Rooms')

appendMessage = (data) ->
  $row = $("""\
<div class="comment">
  <strong class="author"></strong>
  <span class="text"></span>
</div>\
""")
  $row.find('.author').text data.username
  $row.find('.text').text data.message
  $row.insertBefore '#messages .reply.form'

RoomsController.prototype.show = ->
  {room, message_url} = @params

  socket = io.connect('http://localhost:3100')
  socket.on "chat-room/#{room}", (data) -> appendMessage(data)

  $message = $('#message')

  $message.on 'keydown', (e) ->
    return if e.keyCode isnt 13
    e.preventDefault()
    message = $message.val()
    return unless message
    $.ajax
      type: 'POST'
      url: message_url
      data: {message: message}
      success: -> $message.val('')

  $message.focus()
