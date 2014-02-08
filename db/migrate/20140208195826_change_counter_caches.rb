class ChangeCounterCaches < ActiveRecord::Migration
  def change
    add_column :members, :friendships_count,         :integer, null: false, default: 0
    add_column :members, :inverse_friendships_count, :integer, null: false, default: 0

    remove_column :members, :friends_counter
  end
end
