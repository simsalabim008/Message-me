class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
    reject unless current_user.can_access?(@room)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
