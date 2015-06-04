class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_shows = []
    @user.favorite_venues.shuffle.take(3).each do |fav_venue|
      fav_venue.venue.shows.take(4).each do |show|
        @user_shows << show
      end
    end

    @user.favorite_bands.shuffle.take(3).each do |fav_band|
      fav_band.band.shows.take(2).each do |show|
        @user_shows << show
      end
    end
  end
end
