require 'rails_helper'
describe Credit do
  describe '#create' do

    # it "is valid with credit" do
    #   credit = build(:credit)
    #   credit.valid?
    #   expect(credit).to be_valid
    # end

    it "is invalid without card_number" do
      credit = build(:credit, card_number: "")
      credit.valid?
      expect(credit.errors[:card_number]).to include("Card numberを入力してください")
    end

    it "is invalid without expiration_month" do
      credit = build(:credit, expiration_month: "")
      credit.valid?
      expect(credit.errors[:expiration_month]).to include("Expiration monthを入力してください")
    end

    it "is invalid without expiration_year" do
      credit = build(:credit, expiration_year: "")
      credit.valid?
      expect(credit.errors[:expiration_year]).to include("Expiration yearを入力してください")
    end

    it "is invalid without security_code" do
      credit = build(:credit, security_code: "")
      credit.valid?
      expect(credit.errors[:security_code]).to include("Security codeを入力してください")
    end
  end
end