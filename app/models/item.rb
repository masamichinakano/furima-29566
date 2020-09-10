class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :product_status



  belongs_to :user
  has_one_attached :image

  validates :name, :price, :text, :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id, presence: true

  validates :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id, numericality: { other_than: 0 }
end
