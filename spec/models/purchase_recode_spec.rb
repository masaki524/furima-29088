require 'rails_helper'

RSpec.describe PurchaseRecode, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_recode = FactoryBot.build(:purchase_recode)
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@purchase_recode).to be_valid
    end

    it '建物名がなくても保存できる' do
      @purchase_recode.building_name = nil
      @purchase_recode.valid?
      expect(@purchase_recode).to be_valid
    end


    it '郵便番号が入力されていないと保存できない' do
      @purchase_recode.post_num = nil
      @purchase_recode.valid?
      expect(@purchase_recode.errors.full_messages).to include("Post num can't be blank")
    end

    it '郵便番号はハイフンがなければ保存できない' do
      @purchase_recode.post_num =  "1111111"
      @purchase_recode.valid?
      expect(@purchase_recode.errors.full_messages).to include("Post num is invalid")
    end

    it '都道府県が入力されていないと保存できない' do
      @purchase_recode.prefecture_id = 1
      @purchase_recode.valid?
      expect(@purchase_recode.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '市区町村が入力されていないと保存できない' do
      @purchase_recode.city = nil
      @purchase_recode.valid?
      expect(@purchase_recode.errors.full_messages).to include("City can't be blank")

    end

    it '番地が入力されていないと保存できない' do
      @purchase_recode.banch = nil
      @purchase_recode.valid?
      expect(@purchase_recode.errors.full_messages).to include("Banch can't be blank")
    end

    it '電話番号が入力されていないと保存できない' do
      @purchase_recode.phone_num = nil
      @purchase_recode.valid?
      expect(@purchase_recode.errors.full_messages).to include("Phone num can't be blank")
    end

    it '電話番号はハイフンがあると保存できない' do
      @purchase_recode.phone_num = "090-1234-1234" 
      @purchase_recode.valid?
      expect(@purchase_recode.errors.full_messages).to include("Phone num is invalid")
    end
  end
end
