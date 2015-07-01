class AddRatingToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :rating, :integer, null: false
  end
end
