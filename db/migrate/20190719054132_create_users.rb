class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: :false
      t.string :nickname, null: :false
      t.string :email, null: :false
      t.date :birthday
      t.integer :sex, null: :false
      t.boolean :admin, null: :false, default: false

      t.timestamps
    end
  end
end
