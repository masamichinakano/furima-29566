class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id
  belongs_to :user

  validates :name, :price, :text, :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id, presence: true

  validates :category_id, :product_status_id, :shipping_fee_id, :prefectures_id, :shipping_date_id, numericality: { other_than: 1 }
end
