class CompaniesController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@companies = Company.all)
  end

  def show

  end
end
