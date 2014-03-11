class CompaniesController < ApplicationController
  respond_to :html, :json

  def index
    @companies = Company.all
    @my_company_id = (recruiter_signed_in? and current_recruiter.company_id)
    respond_with @companies
  end

  def show
    @company = Company.find params[:id]
    @view_openings = (recruiter_signed_in? and current_recruiter.in? @company.recruiters)
    @positions = @company.positions
    @applied = (candidate_signed_in? and (current_candidate.position_ids & @company.position_ids))
    respond_with @company
  end
end
