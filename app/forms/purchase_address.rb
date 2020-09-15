class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :house_number, :building_name, :tell, :user_id, :item_id, :token


  validates :token, presence: true

  validates :prefectures_id, numericality: { other_than: 0 }
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectures_id
    validates :city
    validates :house_number
    validates :tell, format: {with: /\A\d{11}\z/}
  end

  def save
    # binding.pry
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, postal_code: postal_code, prefectures_id: prefectures_id, city: city, house_number: house_number, building_name: building_name, tell: tell)
  end

end