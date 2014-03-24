class MessagesController < ApplicationController
  respond_to :js

  protected

  def create_message(application_id, body, messager)
    @application = Application.find application_id
    @message = @application.messages.build body: body, messager: messager
    if @message.save
      flash[:notice] = "Successfully Posted Message"
    end
    respond_with @message
  end

  def destroy_message(message_id, messager)
    @message = messager.messages.find message_id
    if @message.destroy
      flash[:notice] = "Message Deleted"
    end
    respond_with @message
  end
end
