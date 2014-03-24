class Recruiter::NotesController < ApplicationController
  before_action :authenticate_recruiter!

  respond_to :js

  def create
    @application = Application.find params[:application_id]
    @note = @application.notes.build body: params[:note][:body], recruiter: current_recruiter
    if @note.save
      flash[:notice] = "Successfully Posted Note"
    end
    respond_with @note
  end

  def destroy
    @note = current_recruiter.notes.find params[:id]
    if @note.destroy
      flash[:notice] = "Note Deleted"
    end
    respond_with @note
  end
end
