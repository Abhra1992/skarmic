class Recruiter::ApplicationsController < ApplicationController
  # before_action :authenticate_recruiter!

  respond_to :js

  def show
    respond_with(@application = Application.find(params[:id]))
  end
end
