class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :product_status



  belongs_to :user
  has_one_attached :image

  validates :name, :text, :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id, :image, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 300}
  validates :price, numericality: {less_than_or_equal_to: 9999999}
  validates :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id, numericality: { other_than: 0 }
end
# validates :price, inclusion: { in: 300..9_999_999 }
