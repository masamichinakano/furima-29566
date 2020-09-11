FactoryBot.define do
  factory :item do
    name { '商品名' }
    price { 3000 }
    text {'テキスト'}
    category_id {1}
    product_status_id {1}
    shipping_fee_id {1}
    prefectures_id {1}
    shipping_date_id {1}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
