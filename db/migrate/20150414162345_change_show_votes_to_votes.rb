class ChangeShowVotesToVotes < ActiveRecord::Migration
  def change
    rename_table :show_votes, :votes
  end
end
