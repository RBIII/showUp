class RemoveNullFalseFromReviewBandId < ActiveRecord::Migration
  def change
    change_column(:reviews, :band_id, :integer, null: true)
  end
end
