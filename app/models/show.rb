class Show < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :date, presence: true
  validates :time, presence: true
  validates :band, presence: true
  validates :venue, presence: true
  acts_as_taggable
  paginates_per 10

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

  def sum_hot_votes
    sum = 0
    if votes.empty?
      0
    else
      votes.where({created_at: (Time.now.midnight-1.day)..Time.now.midnight}).each do |vote|
        sum += vote.value
      end
    end
    sum
  end

  def display_tags
    unless tag_list.nil?
      tag_list.each do |tag|
        puts tag
      end
    end
  end

  def self.search(query)
    shows = []
    bands = joins(:band).where("name ilike ?", "%#{query}%")
    venues = joins(:venue).where("name ilike ?", "%#{query}%")
    tags = Show.tagged_with("#{query}", any: true)
    bands.each do |band|
      shows << band
    end

    venues.each do |venue|
      shows << venue
    end

    tags.each do |tag|
      shows << tag
    end

    shows
  end

  def self.newest_shows
    order(created_at: :desc).limit(5)
  end

  def self.hot_shows
    hot_shows = joins(:votes).where(votes: {created_at: (Time.now.midnight-1.day)..Time.now}).all.includes(:votes)
    hot_shows.sort_by do |show|
      show.sum_hot_votes
    end

    hot_shows.reverse.take(5)
  end

  def self.upcoming_shows
    where("date > ?", Time.now).order(date: :asc).limit(5)
  end

  def self.cheapest_shows
    order(avg_price: :asc).limit(5)
  end

  def user_upvoted?(user)
    if !(user.nil?)
      vote = votes.find_by(user_id: user.id)
      if !(vote.nil?)
        vote.value == 1
      end
    end
  end

  def user_downvoted?(user)
    if !(user.nil?)
      vote = votes.find_by(user_id: user.id)
      if !(vote.nil?)
        vote.value == -1
      end
    end
  end
end
