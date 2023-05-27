FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name {"山田"}
    family_name {"太郎"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth_day {"2003-6-27"}
  end 

end 