class PositionsController < ApplicationController
  respond_to :html, :json

  def show
    @position = Position.find params[:id]
    @company = @position.company
    @application = current_candidate.applications.find_by(position: @position) if candidate_signed_in?
    respond_with @position
  end
end
