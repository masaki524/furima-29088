class PurchaseRecode < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_num, :prefecture_id, :city, :banch, :phone_num, :building_name


  validates :post_num, presence: true , format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true ,numericality: { other_than: 0}
  validates :banch, presence: true , 
  validates :city, presence: true , 
  validates :phone_num, presence: true , 
  validates :building_name, format: {with: /\A0[5789]0\d{4}\d{4}\z/}

end
