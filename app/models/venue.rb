class Venue < ActiveRecord::Base
   has_many :shows
   has_many :bands, through: :shows
   has_many :reviews, as: :reviewable

   validates :name, presence: true, uniqueness: true
   validates :latitude, presence: true
   validates :longitude, presence: true
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

  def average_price
    if shows.empty?
      0
    else
      avg_price = 0
      shows_with_prices = 1
      shows.each do |show|
        if show.avg_price
          avg_price += show.avg_price.to_i
          shows_with_prices += 1
        end
      end
      (avg_price / (shows_with_prices * 3)).to_f
    end
  end

  def display_name
    if name.length > 18
      name[0..17] + "..."
    else
      name
    end
  end
end
