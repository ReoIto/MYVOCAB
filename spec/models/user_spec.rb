require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe User, type: :model do
    # 名前、メール、パスワードがあれば有効な状態であること
    it "is valid with a name, email, and password" do
      user = User.new(
        name: "Ed Sheeran",
        email: "ed@test.com",
        birthday: "19910217",
        password: "ilovehismusicsomuch"
      )
      expect(user).to be_valid
    end

    # 名がなければ無効な状態であること
    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("が入力されていません。")
    end

    # メールアドレスがなければ無効な状態であること
    it "is invalid without an email" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      user = User.create(
        name: "Test1",
        email: "test@test.com",
        password: "jfgkdgkdg"
      )
      user = User.new(
        name: "Test2",
        email: "test@test.com",
        password: "kkdjgakjgj"
      )
      user.valid?
      expect(user.errors[:email]).to include("は既に使用されています。")
    end

    # 名前の文字数が100文字以上の場合無効な状態であること
    it "is invalid with more than 100 characters" do
      user = User.new(
        name: "a" * 101,
        email: "test@test.com",
        password: "password"
      )
      expect(user).to be_invalid
    end

    # emailの文字数が100文字以上の場合無効な状態であること
    it "is invalid with more than 100 characters" do
      user = User.new(
        name: "test",
        email: "a" * 100 + "@test.com",
        password: "password"
      )
      expect(user.invalid?).to be true
    end
  end

end
