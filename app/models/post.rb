class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 100}}
  validates :meaning, {length: {maximum: 100}}
  validates :example, {length: {maximum: 200}}
  validates :synonyms, {length: {maximum: 100}}
  validates :antonyms, {length: {maximum: 100}}
  validates :note, {length: {maximum: 300}}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

end
