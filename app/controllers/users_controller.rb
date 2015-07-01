class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_shows = []
    if @user.favorite_venues
      @user.favorite_venues.shuffle.take(3).each do |fav_venue|
        binding.pry
        fav_venue.venue.shows.take(4).each do |show|
          @user_shows << show
        end
      end
    end

    if @user.favorite_bands
      @user.favorite_bands.shuffle.take(3).each do |fav_band|
        fav_band.band.shows.take(2).each do |show|
          @user_shows << show
        end
      end
    end

    @user_shows = @user_shows.shuffle
  end
end
