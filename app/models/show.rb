class Show < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue
  has_many :reviews, as: :reviewable

  validates :date, presence: true
  validates :time, presence: true
  validates :band, presence: true
  validates :venue, presence: true
end
