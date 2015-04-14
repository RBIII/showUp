class VoteManager
  attr_reader :user, :show, :vote

  def initialize(user, show)
    @user = user
    @show = show
    @vote = find_or_new_vote
  end

  def upvote
    return if multiple_votes?
    vote.upvote
  end

  def downvote
    return if multiple_votes?
    vote.downvote
  end

  private

  def find_or_new_vote
    existing_vote.present? ? existing_vote : user.votes.new(show: show, value: 0)
  end

  def existing_vote
    user.votes.find_by(show: show)
  end

  def multiple_votes?
    user.votes.where(show: show).length > 1
  end
end
