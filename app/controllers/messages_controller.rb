class MessagesController < ApplicationController
   def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil? 
      
      @room = Room.new
      @room.save
      Entry.create(user_id: @user.id, room_id: @room.id)
      Entry.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = entry.room
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
