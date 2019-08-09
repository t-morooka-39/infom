class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :tweet, null: false
      t.references :member, null: false

      t.timestamps

 
      t.index [:member_id, :tweet_id], unique: true
    end
  end
end
