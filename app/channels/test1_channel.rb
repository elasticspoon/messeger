class Test1Channel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'test1'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  def receive(data)
    puts data["message"]
    ActionCable.server.broadcast("test", "ActionCable is connected")
  end
end
