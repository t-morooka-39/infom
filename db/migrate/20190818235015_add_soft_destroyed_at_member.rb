class AddSoftDestroyedAtMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :soft_destroyed_at, :datetime
    add_index :members, :soft_destroyed_at
  end
end
