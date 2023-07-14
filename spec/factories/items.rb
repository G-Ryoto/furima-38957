FactoryBot.define do
  factory :item do

    product_name { Faker::Name.initials(number: 2) }
    product_explanation { Faker::Lorem.sentence }
    category_id {3}
    status_id {3}
    shipping_charge_id {3}
    shipping_date_id {3}
    prefecture_id {3}
    price  {Faker::Number.between(from: 300, to: 9_999_999)}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima.png'), filename: 'furima.png')
    end

  end
end
