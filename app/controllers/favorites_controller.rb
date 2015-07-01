class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:band_id]
      band = Band.find(params[:band_id])

      FavoriteManager.new(current_user, band).change
      redirect_to band_path(band)
    end

    if params[:venue_id]
      venue = Venue.find(params[:venue_id])

      FavoriteManager.new(current_user, venue).change
      redirect_to venue_path(venue)
    end
  end
end
