class AddLastNameToUserModel < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :l_name, :string
  end
end
