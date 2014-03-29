class Candidate::ApplicationsController < ApplicationController
  before_action :authenticate_candidate!

  respond_to :html, :json, only: [:index, :show]
  respond_to :js, only: [:show, :create, :destroy]

  def index
    respond_with(@applications = current_candidate.applications)
  end

  def show
    respond_with(@application = current_candidate.applications.find(params[:id]))
  end

  def create
    @application = current_candidate.applications.create params.permit(:position_id)
    respond_with @application
  end

  def destroy
    @application = current_candidate.applications.find params[:id]
    @application.destroy
    respond_with @application
  end
end
