class Recruiter::MessagesController < MessagesController
  before_action :authenticate_recruiter!

  def create
    self.create_message(params[:application_id], params[:message][:body], current_recruiter)
  end

  def destroy
    self.destroy_message(params[:id], current_recruiter)
  end
end
