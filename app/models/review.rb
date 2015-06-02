class Review < ActiveRecord::Base
  class UnknownReviewable < Exception; end

  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  validates :body, presence: true

  def self.derive_reviewable(params)
    if params[:venue_id]
      Venue.find(params[:venue_id])
    elsif params[:show_id]
      Show.find(params[:show_id])
    elsif params[:band_id]
      Band.find(params[:band_id])
    else
      raise Review::UnknownReviewable
    end
  end

  def owner?(current_user)
    user == current_user
  end
end
