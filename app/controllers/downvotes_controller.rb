class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    show = Show.find(params[:show_id])

    VoteManager.new(current_user, show).downvote
    redirect_to show_path(show)
  end
end
