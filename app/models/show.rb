class Show < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue
  has_many :reviews, as: :reviewable
  has_many :votes

  validates :date, presence: true
  validates :time, presence: true
  validates :band, presence: true
  validates :venue, presence: true
  acts_as_taggable

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
    hot_shows = all.sort_by do |show|
      if !(show.votes.where({created_at: (Time.now.midnight-1.day)..Time.now.midnight}).empty?)
        sum = 0
        show.votes.where({created_at: (Time.now.midnight-1.day)..Time.now.midnight}).each do |vote|
          sum += vote.value
        end
        sum
      else
        0
      end
    end
    hot_shows.take(5)
  end

  def self.upcoming_shows
    order(date: :asc).limit(5)
  end
end
