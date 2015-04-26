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
      (avg_rating / (reviews.length)).to_f
    end
  end

  def display_name
    if name.length > 13
      name[0..12] + "..."
    else
      name
    end
  end
end
