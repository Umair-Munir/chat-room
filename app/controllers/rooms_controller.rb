class RoomsController < ApplicationController
  def connection
    @username = params[:username]
    @room_name = params[:room_name]
    session[:username] = @username unless @username.blank?
    session[:last_room] = @room_name unless @room_name.blank?
    if @username.blank? || @room_name.blank?
      redirect_to root_path, alert: 'Please input your name and room name'
    else
      redirect_to room_path(@room_name)
    end
  end

  def show
    @room_name = params[:id]
  end
end
