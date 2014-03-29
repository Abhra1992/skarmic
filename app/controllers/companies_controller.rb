class CompaniesController < ApplicationController
  respond_to :html, :json

  def index
    @companies = Company.all
    @my_company_id = current_recruiter.company_id if recruiter_signed_in?
    respond_with @companies
  end

  def show
    @company = Company.find params[:id]
    @view_openings = (current_recruiter.in? @company.recruiters) if recruiter_signed_in?
    @positions = @company.positions
    @applied = (current_candidate.position_ids & @company.position_ids) if candidate_signed_in?
    respond_with @company
  end
end
