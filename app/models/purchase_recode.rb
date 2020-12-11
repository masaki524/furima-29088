class PurchaseRecode < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :banch, :phone_num, :building_name


  with_options presence: true do
    validates :post_num , format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id ,numericality: { other_than: 0}
    validates :banch 
    validates :city  
    validates :phone_num , format: {with: /\A0[5789]0\d{4}\d{4}\z/}
  end

  validates :building_name

  def save
    # 購入者情報を保存
    Order.create(user_id: user.id, item_id: item.id)
    # 配送先住所の情報を保存
    Shipping_address.create(post_num: post_num, prefecture_id: prefecture_id, city: city, banch: banch, phone_num: phone_num, building_name: building_name, order_id: order_id)
  end
end
