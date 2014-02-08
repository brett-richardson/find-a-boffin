class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.belongs_to :member
      t.belongs_to :target
      t.timestamps
    end
  end
end
