class ShippingAddress < ApplicationRecord
  belongs_to :purchase_recode

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :prefecture_id, numericality: { other_than: 1 }


  with_options presence: true do
    validates :post_num
    validates :city
    validates :banch
    validates :phone_num
    validates :building_name
  end






end
