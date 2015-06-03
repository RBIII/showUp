class ShowsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def index
    @shows = Show.includes(:band, :venue, :votes).page params[:page]
    @newest_shows = Show.newest_shows.includes(:band, :venue, :votes)
    @hot_shows = Show.hot_shows
    @upcoming_shows = Show.upcoming_shows.includes(:band, :venue, :votes)
    @cheapest_shows = Show.cheapest_shows.includes(:band, :venue, :votes)

  end

  def show
    @show = Show.find(params[:id])
    if @artists_tracks = RSpotify::Artist.search(@show.band.name).first
      @artists_tracks = RSpotify::Artist.search(@show.band.name).first.top_tracks(:US).sort_by { |track| track.popularity }.reverse.take(5)
    end
    @review = Review.new

    respond_to do |format|
      format.json { render json: @show.venue }
      format.html
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update(show_params)
      flash[:notice] = 'Tags added'
      redirect_to show_path
    else
      flash[:alert] = 'Error: Tags not added'
      render :edit
    end
  end

  private
  def show_params
    params.require(:show).permit(:tag_list)
  end
end
