class Post < ApplicationRecord
    belongs_to :user

    validates :content, {presence: true, length: {maximum: 100}}
    validates :user_id, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end

    def self.search(searchword)
        return Post.where(['content LIKE ?', "%#{searchword}%"])
    end
end
