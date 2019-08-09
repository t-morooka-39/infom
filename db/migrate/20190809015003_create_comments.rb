class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :tweet, null: false
      t.string :name
      t.text :body
      t.timestamps
    end
  end
end
