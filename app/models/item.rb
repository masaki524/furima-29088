class Item < ApplicationRecord
  #validateの設定
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :detail, length: { maximum: 1000 }
    validates :price, numericality: { 
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9999999
              },
              format: { with: /\A[0-9]+\z/}
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_charge
  belongs_to :status

  belongs_to :user
  has_one_attached :image


  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :shipping_charge_id
    validates :status_id
  end

  has_one :order

end
