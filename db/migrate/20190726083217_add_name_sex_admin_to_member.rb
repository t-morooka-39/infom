class AddNameSexAdminToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string

    add_column :members, :sex, :integer
    add_column :members, :admin, :boolean, default: false
  end
end
