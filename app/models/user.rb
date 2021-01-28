class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_secure_password


  validates :name, {
                    presence: true,
                    length: {maximum: 100}
                   }

  validates :email, {
                     presence: true,
                     uniqueness: true,
                     length: {maximum: 100}
                    }

  def posts
    return Post.where(user_id: self.id)
  end

end
