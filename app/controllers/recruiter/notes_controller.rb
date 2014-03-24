class Recruiter::NotesController < ApplicationController
  before_action :authenticate_recruiter!

  respond_to :js

  def create
    @application = Application.find params[:application_id]
    @note = @application.notes.create body: params[:note][:body], recruiter: current_recruiter
    respond_with @note
  end

  def destroy
    @note = current_recruiter.notes.find params[:id]
    @note.destroy
    respond_with @note
  end
end
