class PurchaseRecode < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_num, :prefecture_id, :city, :banch, :phone_num, :building_name, :order_id


  with_options presence: true do
    validates :post_num , format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :banch 
    validates :city
    validates :phone_num , format: {with: /\A0[5789]0\d{4}\d{4}\z/}
    validates :token
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id ,numericality: { other_than: 1}

  def save
    # 購入者情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 配送先住所の情報を保存
    ShippingAddress.create(post_num: post_num, prefecture_id: prefecture_id, city: city, banch: banch, phone_num: phone_num, building_name: building_name, order_id: order.id)
  end
end
