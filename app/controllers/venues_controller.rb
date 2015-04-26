class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @shows = Venue.find(params[:id]).shows.page(params[:page]).per(3)
    @review = Review.new

    respond_to do |format|
      format.json { render json: @venue }
      format.html
    end
  end
end
