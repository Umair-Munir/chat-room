class RoomsController < ApplicationController
  before_action :set_room!, only: [:show, :message]

  def connection
    @username = params[:username]
    @room = params[:room]
    session[:username] = @username unless @username.blank?
    session[:last_room] = @room unless @room.blank?
    if @username.blank? || @room.blank?
      redirect_to root_path, alert: 'Please input your name and room name'
    else
      redirect_to room_path(@room)
    end
  end

  def show
    if session[:username]
      js room: @room, message_url: message_room_path(@room)
    else
      redirect_to root_path
    end
  end

  def message
    payload = {
      room: @room,
      username: session[:username],
      message: params[:message]
    }
    $redis.publish 'chat-room', payload.to_json
    head :no_content
  end

  private

  def set_room!
    @room = params[:id]
  end
end
