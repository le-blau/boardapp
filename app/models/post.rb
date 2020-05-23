class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 100}}
    validates :user_id, {presence: true}

    def self.search(searchword)
        return Post.where(['content LIKE ?', "%#{searchword}%"])
    end
end
