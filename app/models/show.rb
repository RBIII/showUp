class Show < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue
  has_many :reviews, as: :reviewable
  has_many :votes

  validates :date, presence: true
  validates :time, presence: true
  validates :band, presence: true
  validates :venue, presence: true

  def sum_of_votes
    sum = 0
    if votes.empty?
      0
    else
      votes.each do |vote|
        sum += vote.value
      end
    end
    sum
  end
end
