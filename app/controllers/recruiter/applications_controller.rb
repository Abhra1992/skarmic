class Recruiter::ApplicationsController < ApplicationController
  # before_action :authenticate_recruiter!

  respond_to :js

  def show
    respond_with(@application = Application.find(params[:id]))
  end

  def rate
    @application = Application.find params[:id] # current_recruiter.applications
    @rating = params[:rating]
    @application.rating = @rating
    if @application.save
      render nothing: true
    end
  end
end
