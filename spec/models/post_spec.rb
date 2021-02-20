require 'rails_helper'

RSpec.describe Post, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

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

  it 'is invalid without a content' do
    post = @user.posts.build(
      content: nil,
      meaning: '単語帳'
    )
    post.valid?
    expect(post.errors[:content]).to include('が入力されていません。')
  end

  it 'is invalid with more than 100 characters' do
    post = @user.posts.build(
      content: 'a' * 101
    )
    expect(post.errors[:content]).to include('too long')
  end
end
