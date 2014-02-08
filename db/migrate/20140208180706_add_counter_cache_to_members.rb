class AddCounterCacheToMembers < ActiveRecord::Migration
  def change
    add_column :members, :friends_counter, :integer
  end
end
