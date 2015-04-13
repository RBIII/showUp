class AddIndexToVenueName < ActiveRecord::Migration
  def change
    add_index(:venues, :name, unique: true)
  end
end
