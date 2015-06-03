class CreateShowVotes < ActiveRecord::Migration
  def change
    create_table :show_votes do |t|
      t.integer :user_id
      t.integer :show_id
      t.timestamps
    end
  end
end
