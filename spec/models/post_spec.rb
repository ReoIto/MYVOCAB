require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe Post, type: :model do
    it 'is valid with a content' do
      user = FactoryBot.create(:user)
      post = user.posts.build(
        content: 'Vocab'
      )
      expect(post).to be_valid
    end

    it 'is invalid without a content' do
      user = FactoryBot.create(:user)
      post = user.posts.build(
        content: nil,
        meaning: '単語帳'
      )
      post.valid?
      expect(post.errors[:content]).to include('が入力されていません。')
    end

    it 'is invalid with more than 100 characters' do
      user = FactoryBot.create(:user)
      post = user.posts.build(
        content: 'a' * 101
      )
      expect(post).to be_invalid
    end
  end
end
