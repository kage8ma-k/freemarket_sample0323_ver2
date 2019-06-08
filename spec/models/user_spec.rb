require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with user" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid

    end
    it "is invalid without nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("ニックネームを入力してください")

    end

    it "is invalid without email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスを入力してください")
    end

    it "is invalid without password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("パスワードを入力してください")
    end
  end
end