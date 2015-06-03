class AddPolymorphicRelationToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewable, :integer
    add_column :reviews, :reviewable_type, :string
  end
end
