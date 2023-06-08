FactoryBot.define do
  factory :item do

    product_name { Faker::Name.initials(number: 2) }
    product_explanation { Faker::Lorem.sentence }
    category_id {1}
    status_id {1}
    shipping_charge_id {1}
    shipping_date_id {1}
    prefecture_id {1}
    price  {Faker::Number.between(from: 300, to: 9_999_999)}

   
  end
end
