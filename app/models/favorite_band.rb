class FavoriteBand < ActiveRecord::Base
  belongs_to :band
  belongs_to :user

  validates :user, presence: true
  validates :band, presence: true

  def favorite
    self[:favorite] || false
  end

  def is_favorite?
    favorite
  end

  def to_favorite
    update_attributes(favorite: true)
  end

  def to_unfavorite
    update_attributes(favorite: false)
  end

  def change
    if is_favorite?
      to_unfavorite
    else
      to_favorite
    end
  end
end 