class ShowsController < ApplicationController

  def index
    @shows = Show.all
  end

  def show
    
  end

end
