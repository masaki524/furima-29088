class Item < ApplicationRecord
  #validateの設定
  validates :name,   presence: true, length: { maximum: 40 }
  validates :detail, presence: true, length: { maximum: 1000 }
  validates :price,  presence: true, numericality: { 
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9999999
            },
            format: { with: /\A[0-9]+\z/}
  validates :image,  presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_charge
  belongs_to :status

  belongs_to :user
  has_one_attached :image


  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,       numericality: { other_than: 1 } 
  validates :prefecture_id,     numericality: { other_than: 1 } 
  validates :shipping_date_id,  numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :status_id,         numericality: { other_than: 1 } 

end