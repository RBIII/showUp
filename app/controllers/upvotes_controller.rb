class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    show = Show.find(params[:show_id])

    VoteManger.new(current_user, show).upvote
    redirect_to shows_path
  end
end
