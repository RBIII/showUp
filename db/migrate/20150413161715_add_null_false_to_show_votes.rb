class AddNullFalseToShowVotes < ActiveRecord::Migration
  def change
    change_column :show_votes, :user_id, :integer, null: false
    change_column :show_votes, :show_id, :integer, null: false
  end
end
