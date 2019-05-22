class UserProfile < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :lastname
    validates :firstname
    validates :lastname_kana
    validates :firstname_kana
    validates :birth_year
    validates :birth_month
    validates :birth_day
  end

  validates :phone_number,
            presence: false,
            format: {with: /\A[0-9-]{,14}\z/}, length: { minimum: 8},
            on: :phone_number_validates
  # context: :phone_number_validatesのときだけバリデーションをかける

  with_options on: :address do |address|
    address.validates :postal_code, presence: true
    address.validates :prefecture, presence: true
    address.validates :city, presence: true
    address.validates :block_number, presence: true
    address.validates :building_name, presence: true
    address.validates :user_id, uniqueness: true
  end

end
