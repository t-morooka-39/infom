class RemoveEmailIndexFromMember < ActiveRecord::Migration[5.2]
  def change
    def up
      remove_index :members, :email
      add_index :members, [:email, :soft_destroyed_at], unique: true
    end
    
    def down
      remove_index :members, [:email, :soft_destroyed_at]
      add_index :members, :email, unique: true
    end
  end
end
