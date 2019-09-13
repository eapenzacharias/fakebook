class PostLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liked, default: 0
    
      t.timestamps
    end
    add_reference :likes, :user, index: true
    add_reference :likes, :post, index: true
  end
end
