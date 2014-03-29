class Recruiter::ApplicationsController < ApplicationController
  before_action :authenticate_recruiter!

  respond_to :js

  def show
    respond_with(@application = current_recruiter.applications.find(params[:id]))
  end

  def rate
    @application = current_recruiter.applications.find params[:id]
    @rating = params[:rating]
    @application.update_attribute :rating, @rating
  end
end
