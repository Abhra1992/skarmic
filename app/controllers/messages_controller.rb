class MessagesController < ApplicationController
  respond_to :js

  protected

  def create_message(application_id, body, messager)
    @message = Application.find(application_id).messages.build(body: body, messager: messager)
    if @message.save
      flash[:notice] = "Successfully Posted Message"
    end
    respond_with @message
  end

  def destroy_message(id, messager)
    @message = messager.messages.find(id)
    if @message.destroy
      flash[:notice] = "Message Deleted"
    end
    respond_with @message
  end
end
