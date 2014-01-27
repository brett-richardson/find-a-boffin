class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :website
      t.string :short_url
      t.text   :content

      t.timestamps
    end
  end
end
