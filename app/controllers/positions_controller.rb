class PositionsController < ApplicationController
  respond_to :html, :json

  def show
    @position = Position.find params[:id]
    @company = @position.company
    respond_with @position
  end
end
