class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :bio, :string
    add_column :users, :img_link, :string
  end
end
