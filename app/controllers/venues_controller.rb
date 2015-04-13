class VenuesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :fetch_venue, only: [:show, :edit, :destroy, :update]

  def index
    @venues = Venue.all
  end

  def show
    @bands = Band.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash[:notice] = 'Venue Successfully Created'
      redirect_to @venue
    else
      flash[:alert] = 'Error: Venue not created'
      redirect_to venues_path
    end
  end

  private
  def venue_params
    params.require.(:venue).permit(:name, :location)
  end

  def fetch_venue
    @venue = Venue.find(params[:id])
  end
end
