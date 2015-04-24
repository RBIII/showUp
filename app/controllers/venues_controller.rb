class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.includes(:shows, :bands).find(params[:id])
    # @serialized_venue = Venue.find(params[:id])
    @review = Review.new

    respond_to do |format|
      format.json { render json: @venue }
      format.html
    end
  end
end
