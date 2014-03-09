class Recruiter::MessagesController < ApplicationController
  before_action :authenticate_recruiter!
  respond_to :js

  def create
    @message = Application.find(params[:application_id]).messages.build(body: params[:message][:body], messager: current_recruiter)
    if @message.save
      flash[:notice] = "Successfully Posted Message"
    end
    respond_with @message
  end

  def destroy
    @message = Message.find params[:id]
    if @message.destroy
      flash[:notice] = "Message Deleted"
    end
    respond_with @message
  end
end
