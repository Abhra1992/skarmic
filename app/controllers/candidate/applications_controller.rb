class Candidate::ApplicationsController < ApplicationController
  before_action :authenticate_candidate!

  respond_to :html, :json, only: [:index, :show]
  respond_to :js, only: [:create, :destroy]

  def index
    respond_with(@applications = current_candidate.applications)
  end

  def show
    respond_with(@application = current_candidate.applications.find(params[:id]))
  end

  def create
    @application = current_candidate.applications.build params.permit(:position_id)
    if @application.save
      flash[:success] = "Successfully Applied for position"
    end
    respond_with @application
  end

  def destroy
    @application = current_candidate.applications.find_by_position_id(params[:position_id])
    if @application.destroy
      flash[:notice] = "Application Deleted"
    end
    respond_with @application
  end
end
