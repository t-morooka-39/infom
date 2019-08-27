class AddTesterToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :tester, :boolean, default: false
  end
end
