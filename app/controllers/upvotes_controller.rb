class UpvotesController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def create
    @show = Show.find(params[:show_id])
    unless Vote.where("user_id = ? and show_id = ?", current_user.id, params[:show_id]).empty?
      @last_value = Vote.where("user_id = ? and show_id = ?", current_user.id, params[:show_id]).first.value
    else
      @last_value = 0
    end

    VoteManager.new(current_user, @show).upvote
    @vote = Vote.where("user_id = ? and show_id = ?", current_user.id, params[:show_id]).first
    respond_to do |format|
      format.html {redirect_to @show}
      format.js
    end
  end

  private
  def authenticate_user
    if request.format.js? && current_user.nil?
      flash[:notice] = "You must be logged in"
      respond_to do |format|
        format.js { render :js => "window.location.href = '#{new_user_session_path}'" }
      end
    else
      authenticate_user!
    end
  end
end
