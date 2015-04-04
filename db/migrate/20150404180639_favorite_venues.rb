class FavoriteVenues < ActiveRecord::Migration
  def change
    create_table :favorite_venues do |t|
      t.boolean :favorite, null: false
      t.integer :user_id, null: false
      t.integer :venue_id, null: false
      t.timestamps
    end
  end
end
