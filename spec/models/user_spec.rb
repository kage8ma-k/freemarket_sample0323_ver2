require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = User.new(nickname: "", email: "", password: "", password_confirmation: "")
      user.valid?
      expect(user.errors[:nickname]).to include("Nicknameを入力してください")
      expect(user.errors[:email]).to include("Emailを入力してください")
      expect(user.errors[:password]).to include("Passwordを入力してください")
    end
  end
end