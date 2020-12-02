require 'rails_helper'



RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context "商品が登録される場合" do
      it "image/name/detail/price/category/prefecture/shipping_charge/shipping_date/statusが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品登録ができない場合" do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "detailが空だと登録できない" do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
       end

      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが¥299以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが¥9,999,999より高いと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "priceが半角数字でなければ登録できない" do
        @item.price = "６００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "categoryが選択されていないと登録できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "prefectureが選択されていないと登録できない" do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it "shipping_chargeが空だと登録できない" do
        @item.shipping_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end

      it "shipping_dateが空だと登録できない" do
        @item.shipping_date = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is not a number")
      end

      it "statusが空だと登録できない" do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
    end
  end
end
