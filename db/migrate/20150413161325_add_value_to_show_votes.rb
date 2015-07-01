class AddValueToShowVotes < ActiveRecord::Migration
  def change
    add_column :show_votes, :value, :integer, default: 0, null: false
  end
end
