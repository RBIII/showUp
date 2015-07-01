class BandsController < ApplicationController
  def index
    @bands = Band.all.page params[:page]
  end

  def show
    @band = Band.find(params[:id])
    if @artists_tracks = RSpotify::Artist.search(@band.name).first
      @artists_tracks = RSpotify::Artist.search(@band.name).first.top_tracks(:US).sort_by { |track| track.popularity }.reverse.take(5)
    end
    @review = Review.new
  end
end
