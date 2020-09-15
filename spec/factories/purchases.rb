FactoryBot.define do
  factory :purchase do
    postal_code {123-1234}
    prefectures_id {1}
    city {"堺市"}
    house_number {"3-3"}
    building_name {"ビル"}
    tell {09012345678}
  end
end
