class Credit < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :card_number
    validates :expiration_month
    validates :expiration_year
    validates :security_code
  end
end
