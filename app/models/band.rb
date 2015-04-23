class Band < ActiveRecord::Base
  has_many :shows
  has_many :venues, through: :shows
  has_many :reviews, as: :reviewable

  validates :name, presence: true
  paginates_per 15

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

  def display_name
    if name.length > 9
      name[0..8] + "..."
    else
      name
    end
  end
end
