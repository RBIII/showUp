class VenuesController < ApplicationController

  def index
    @veunes = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
    @show = Show.new
  end
  
end
