class CompaniesController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@companies = Company.all)
  end

  def show
    @company = Company.find params[:id]
    @positions = @company.positions
    respond_with @company
  end
end