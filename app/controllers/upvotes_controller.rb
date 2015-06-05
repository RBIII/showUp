class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @show = Show.find(params[:show_id])
    VoteManager.new(current_user, @show).upvote
    @upvote = current_user.votes.find_by(show: @show)
    redirect_to show_path(@show)
  end
end
