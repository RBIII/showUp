class Band < ActiveRecord::Base
  has_many :shows
  has_many :venues, through: :shows
  has_many :reviews, as: :reviewable

  validates :name, presence: true
end
