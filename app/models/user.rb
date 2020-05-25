class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    validates :email, {uniqueness: true}
    validates :password, {presence: true, on: :create}

    has_secure_password

    def posts
        return Post.where(user_id: self.id)
    end

end
