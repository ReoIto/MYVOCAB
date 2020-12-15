class User < ApplicationRecord
  validates :name, {
                    presence: true,
                    length: {maximum: 100}
                   }

  validates :email, {
                     presence: true,
                     uniqueness: true,
                     length: {maximum: 100}
                    }

  validates :password, {
                        presence: true
                       }

  def posts
    return Post.where(user_id: self.id)
  end

end
