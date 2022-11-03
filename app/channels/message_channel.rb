class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "Created connection at #{Time.now.iso8601(3)}"
    stream_from 'message'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    puts data.inspect
    data['user'] = current_user
    ActionCable.server.broadcast('message', data)
  end

  def test_method(data)
    puts data.inspect
  end
end
