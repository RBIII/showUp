class Venue < ActiveRecord::Base
   has_many :shows
   has_many :bands, through: :shows
   has_many :reviews, as: :reviewable

   validates :name, presence: true
   validates :latitude, presence: true
   validates :longitude, presence: true
end
