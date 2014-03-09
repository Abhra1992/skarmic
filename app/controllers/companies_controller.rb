class CompaniesController < ApplicationController
  respond_to :html, :json

  def index
    respond_with(@companies = Company.all)
  end

  def show
    @company = Company.find params[:id]
    @view_openings = (recruiter_signed_in? and current_recruiter.in? @company.recruiters)
    @positions = @company.positions
    @applied = (candidate_signed_in? and (current_candidate.position_ids & @company.position_ids))
    respond_with @company
  end
end
