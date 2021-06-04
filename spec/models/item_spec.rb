require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    it "nameが空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "introductionが空では登録できない" do
      @item.introduction = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "categoryの選択が---だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "conditionの選択が---だと登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
  
    it "costの選択が---だと登録できない" do
      @item.cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost must be other than 1")
    end

    it "prefectureの選択が---だと登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "delivery_timeの選択が---だと登録できない" do
      @item.delivery_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
    end

    it "priceが空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが¥300以下だと登録できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが¥9999999以上だと登録できない" do
      @item.price = 99999999
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    
    it "priceが半角数字であれば登録できる" do
      @item.price = 300
      expect(@item).to be_valid
    end

    it "priceが半角数字でないと登録できない" do
      @item.price = "２２２２"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが半角英数字混合では登録できない" do
      @item.price = "123abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが半角英字では登録できない" do
      @item.price = "abcdef"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
