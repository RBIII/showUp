class ChangeColumnOnReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :reviewable, :integer
    add_column :reviews, :reviewable_id, :integer
  end
end
