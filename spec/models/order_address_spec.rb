require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入処理' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context "内容に問題ない場合" do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end
      it "building_nameは空でも保存できる" do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it "tokenが空では登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空だと保存できない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない" do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefectureの選択が---だと登録できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "municipalityが空だと登録できない" do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it "house_numberが空だと登録できない" do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      
      it "phone_numberが空だと登録できない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberに数字以外があると登録できない" do
        @order_address.phone_number = "080abcd1234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは11桁以内でないと登録できない" do
        @order_address.phone_number = "080123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      
    end
  end
end
