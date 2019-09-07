class AddImagesToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :image1, :string
    add_column :tweets, :image2, :string
  end
end
