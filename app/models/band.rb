class Band < ActiveRecord::Base
  has_many :shows
  has_many :venues, through: :shows
  has_many :reviews, as: :reviewable

  validates :name, presence: true

  def average_rating
    if reviews.empty?
      0
    else
      avg_rating = 0
      reviews.each do |review|
        avg_rating += review.rating
      end
    end
  end
end
