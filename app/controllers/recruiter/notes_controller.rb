class Recruiter::NotesController < ApplicationController
  before_action :authenticate_recruiter!

  def create
    @note = Application.find(params[:application_id]).notes.build(body: params[:note][:body], recruiter: current_recruiter)
    if @note.save
      flash[:notice] = "Successfully Posted Note"
    end
    respond_with @note
  end

  def destroy
    @note = current_recruiter.notes.find(params[:id])
    if @note.destroy
      flash[:notice] = "Note Deleted"
    end
    respond_with @note
  end
end
