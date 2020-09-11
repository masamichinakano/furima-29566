require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目が存在すれば保存される' do
      expect(@item).to be_valid
    end

    it 'nemeが存在しないと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが存在しないと出品できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'priceが存在しないと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'category_idが--であると出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it 'product_status_idが--であるとないと出品できない' do
      @item.product_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Product status must be other than 0')
    end

    it 'shipping_fee_idが--であると出品できない' do
      @item.shipping_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee must be other than 0')
    end

    it 'prefectures_idが--であると出品できない' do
      @item.prefectures_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefectures must be other than 0')
    end

    it 'shipping_date_idが--であると出品できない' do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date must be other than 0')
    end

    it 'imageが存在しないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'priceが300円未満である場合は出品できない' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9999999円を超える場合は出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

  end
end
