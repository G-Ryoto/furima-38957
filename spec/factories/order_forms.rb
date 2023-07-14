FactoryBot.define do
  factory :order_form do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    postcode {"123-1234"}
    prefecture_id {2}
    city {"広島市中区土橋町"}
    block {1-1-101}
    building {"チサンマンション"}
    phone_number { "00000000000" }
    token {Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
