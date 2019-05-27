FactoryBot.define do

  factory :credit do
    card_number              {"1111111111111111"}
    expiration_month         {12}
    expiration_year          {2018}
    security_code            {"345"}
  end

end