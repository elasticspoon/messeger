class MessagesController < ApplicationController
  # def create
  #   @message = current_user.messages.build(message_params)
  #   @message.save

  #   ActionCable.server.broadcast('message', @message.as_json(include: :user))
  # end
  def create
    @message = current_user.messages.build(message_params)
    @message.save

    @message.broadcast_append_to('message', target: 'message-display', 
      partial: 'messages/message')

    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.append('message-display', partial: 'messages/message')
    #   end

    #   format.html { redirect_to hangouts_path }
    # end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
