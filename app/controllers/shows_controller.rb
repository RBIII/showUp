class ShowsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def index
    if params[:search]
      @shows = Show.search(params[:search])
    else
      @shows = Show.includes(:band, :venue, :votes)
      @newest_shows = Show.newest_shows.includes(:band, :venue, :votes)
      @hot_shows = Show.hot_shows
      @upcoming_shows = Show.upcoming_shows.includes(:band, :venue, :votes)
    end
  end

  def show
    @show = Show.find(params[:id])
    @artists_tracks = RSpotify::Artist.search(@show.band.name).first.top_tracks(:US).sort_by { |track| track.popularity }.reverse.take(5)
    @review = Review.new
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
