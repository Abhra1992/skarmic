class Recruiter::ApplicationsController < ApplicationController
  before_action :authenticate_recruiter!

  respond_to :js

  def show
    respond_with(@application = current_recruiter.applications.find(params[:id]))
  end

  def rate
    @application = current_recruiter.applications.find params[:id]
    @rating = params[:rating]
    @application.rating = @rating
    if @application.save
      render nothing: true
    end
  end
end
