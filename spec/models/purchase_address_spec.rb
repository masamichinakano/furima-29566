require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe "商品購入機能" do
    before do
      @purchase = FactoryBot.build(:purchase_address)
    end
  
    it "全ての項目が存在すれば保存される" do
      expect(@purchase).to be_valid
    end

    it "postal_codeが存在しないと保存できない" do
      @purchase.postal_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it "postal_codeにハイフンが存在しないと保存できない" do
      @purchase.postal_code = "1111111"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefectures_idが存在しなしと保存できない" do
      @purchase.prefectures_id = "0"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefectures must be other than 0")
    end

    it "cityが存在しないと保存できない" do
      @purchase.city = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが存在しないと保存できない" do
      @purchase.house_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("House number can't be blank")
    end

    it "tellが存在しないと保存できない" do
      @purchase.tell = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Tell can't be blank")
    end

    it "tellにハイフンが存在すると保存できない" do
      @purchase.tell = "090-12345678"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Tell is invalid")
    end

    it "tellが11未満であると保存できない" do
      @purchase.tell = "090"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Tell is invalid")
    end

    it "tokenが存在しないと保存できない" do
      @purchase.token = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end  
  end
end
