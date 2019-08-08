class CreateTweetImages < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_images do |t|
      t.references :tweet
      t.integer :position

      t.timestamps
    end
  end
end
