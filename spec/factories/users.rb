FactoryBot.define do
  factory :user do
    nickname
    email
    password
    password_confirmation
    f_name
    l_name
    f_name_leader
    l_name_leader
    birthday
  end
end