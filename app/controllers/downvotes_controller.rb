class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @show = Show.find(params[:show_id])
    if Vote.find_by(show: @show)
      @last_value = Vote.find_by(show: @show).value
    else
      @last_value = 0
    end

    VoteManager.new(current_user, @show).downvote
    @vote = Vote.find_by(show: @show)
    respond_to do |format|
      format.html {redirect_to @show}
      format.js
    end
  end
end
