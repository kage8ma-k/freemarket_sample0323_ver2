FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    content {"犬"}
    item_condition {"新品"}
    delivery_burden {"送料込み"}
    delivery_method {"クロネコヤマト"}
    delivery_area {"大阪府"}
    delivery_date {"3~5日以内に発送"}
    price {Faker::Number.number(4)}
    created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end
