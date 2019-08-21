class AddForeginKeyToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference(:posts, :user_id, foreign_key: {to_table: :users})
  end
end
