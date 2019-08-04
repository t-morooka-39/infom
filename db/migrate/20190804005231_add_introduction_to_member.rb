class AddIntroductionToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :introduction, :string
  end
end
