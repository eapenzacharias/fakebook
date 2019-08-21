class Post < ApplicationRecord
    validates :user, presence :true
    validates :content, presence :true

    belongs_to :user, class_name: :User, foreign_key: :user_id
end
