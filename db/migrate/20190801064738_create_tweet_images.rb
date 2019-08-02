class CreateTweetImages < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_images do |t|
      t.references :tweet
      t.string :alt_text
      t.integer :position

      t.timestamps
    end
  end
end
