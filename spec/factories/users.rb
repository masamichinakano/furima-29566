FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    f_name {"山田"}
    l_name { "太郎"}
    f_name_leader {"ヤマダ"}
    l_name_leader {"タロウ"}
    birthday {Faker::Date.birthday}
  end
end