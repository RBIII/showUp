class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :date, null: false
      t.string :time, null: false
      t.text :ticket_url
      t.text :image_url
      t.string :avg_price
      t.integer :band_id, null: false
      t.integer :venue_id, null: false

      t.timestamps
    end
  end
end
