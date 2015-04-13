class RemoveLocationFromVenues < ActiveRecord::Migration
  def change
    remove_column :venues, :location
  end
end
