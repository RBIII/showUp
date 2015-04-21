class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.includes(:shows, :bands).find(params[:id])
    @review = Review.new
  end
end
