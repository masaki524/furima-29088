class Item < ApplicationRecord
  #validateの設定
  validates :name,   presence: true
  validates :detail, presence: true
  validates :price,  presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_charge
  belongs_to :status
  belongs_to :user

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,       numericality: { other_than: 1 } 
  validates :prefecture_id,     numericality: { other_than: 1 } 
  validates :shipping_date_id,  numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :status_id,         numericality: { other_than: 1 } 

end
