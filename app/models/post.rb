class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 100}}

    def self.search(searchword)
        return Post.where(['content LIKE ?', "%#{searchword}%"])
    end
end
