class RemoveColumnsFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :band_id, :integer
    remove_column :reviews, :venue_id, :integer
  end
end
