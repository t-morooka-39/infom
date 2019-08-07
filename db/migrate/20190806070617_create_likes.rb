class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :tweet, null: false
      t.references :member, null: false

      t.timestamps
    end
  end
end
