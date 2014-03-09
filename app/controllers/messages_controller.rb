class MessagesController < ApplicationController
  before_action :authenticate_messager!
  respond_to :js

  def create
    @application = Application.find params[:application_id]
    @message = @application.messages.build(body: params[:message][:body], messager: @messager)
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

  private

  def authenticate_messager!
    if candidate_signed_in?
      @messager = current_candidate
    elsif recruiter_signed_in?
      @messager = current_recruiter
    end
    if @messager.nil?
      raise Exception("Unauthorized Message")
    end
  end
end
