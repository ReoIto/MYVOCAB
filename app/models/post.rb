class Post < ApplicationRecord
  validates :content, { :presence => {:message => '(Vocab)を入力してください'}, length: { maximum: 100 } }
  validates :meaning, { length: { maximum: 100 } }
  validates :example, { length: { maximum: 100 } }
  validates :synonyms, { length: { maximum: 100 } }
  validates :antonyms, { length: { maximum: 100 } }
  validates :note, { length: { maximum: 300 } }
  validates :user_id, { presence: true }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def user
    return User.find_by(id: self.user_id)
  end
end
