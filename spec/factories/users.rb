FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"aaa111"}
    password_confirmation {password}
    f_name {"山田"}
    l_name { "太郎"}
    f_name_leader {"ヤマダ"}
    l_name_leader {"タロウ"}
    birthday {Faker::Date.birthday}
  end
end