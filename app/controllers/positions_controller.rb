class PositionsController < ApplicationController
  respond_to :html, :json

  def show
    @position = Position.find params[:id]
    @company = @position.company
    @application = candidate_signed_in? && current_candidate.applications.find_by_position_id(@position.id)
    respond_with @position
  end
end
