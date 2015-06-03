class FavoriteBands < ActiveRecord::Migration
  def change
    create_table :favorite_bands do |t|
      t.boolean :favorite, null: false
      t.integer :user_id, null: false
      t.integer :band_id, null: false
      t.timestamps
    end
  end
end
