class Venue < ActiveRecord::Base
   has_many :shows
   has_many :bands, through: :shows

   validates :name, presence: true
   validates :latitude, presence: true
   validates :longitude, presence: true
end
