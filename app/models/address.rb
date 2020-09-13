class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :prefectures

  validates :postal_code, :prefecture_id, :city, :house_number, :tell, presence: true
  validates :prefectures_id, numericality: { other_than: 0 }
end
