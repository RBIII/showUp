class SearchesController < ApplicationController
  def index
    @shows = Show.search(params[:search])
  end
end
