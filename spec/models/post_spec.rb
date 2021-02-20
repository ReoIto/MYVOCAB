require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validation' do
    before do
      @user = FactoryBot.create(:user)
    end
    context 'When a post is valid' do
      it 'is valid with a content' do
        user = User.create!(
          name: 'hoge',
          email: 'hoge@test.com',
          password: 'password'
        )
        post = user.posts.build(
          content: 'Vocab'
        )
        expect(post).to be_valid
      end
    end

    context 'When a post is invalid' do
      it 'is invalid without a content' do
        post = @user.posts.build(
          content: nil,
          meaning: '単語帳'
        )
        post.valid?
        expect(post.errors[:content]).to include('が入力されていません。')
      end

      it 'is invalid with a content more than 100 characters' do
        post = @user.posts.build(
          content: 'a' * 101
        )
        expect(post.invalid?).to be true
      end

      it 'is invalid with a note more than 300 characters' do
        post = @user.posts.build(
          content: 'Vocab',
          note: 'あ' * 301
        )
        expect(post).to be_invalid
      end
    end
  end
end
