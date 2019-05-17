FactoryBot.define do
  factory :user do
    nickname              { 'ttt' }
    sequence(:email) {Faker::Internet.email}
    password              { 'q1w2e3r4' }
  end
end
