class FavoriteManager
  attr_reader :user, :object
  def initialize(user, object)
    @user = user
    @object = object
    @favorite = find_or_new_favoite
  end

  def change
    @favorite.change
  end

  private

  def find_or_new_favoite
    if existing_favorite.present?
      existing_favorite
    elsif @object.class == Band
      user.favorite_bands.new(band: @object, favorite: true)
    else
      user.favorite_venues.new(venue: @object, favorite: true)
    end
  end

  def existing_favorite
    if @object.class == Band
      user.favorite_bands.find_by(band: @object)
    else
      user.favorite_venues.find_by(venue: @object)
    end
  end
end