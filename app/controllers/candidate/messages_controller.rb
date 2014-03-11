class Candidate::MessagesController < ApplicationController
  before_action :authenticate_candidate!

  def create
    self.create_message(params[:application_id], params[:message][:body], current_candidate)
  end

  def destroy
    self.destroy_message(params[:id], current_candidate)
  end
end
