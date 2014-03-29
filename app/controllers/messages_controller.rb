class MessagesController < ApplicationController
  respond_to :js

  protected

  def create_message(application_id, body, messager)
    @application = Application.find application_id
    @message = @application.messages.create body: body, messager: messager
    respond_with @message
  end

  def destroy_message(message_id, messager)
    @message = messager.messages.find message_id
    @message.destroy
    respond_with @message
  end
end
