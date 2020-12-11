class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.string :post_num, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :banch, null: false
      t.string :phone_num, null: false
      t.string :building_name
      t.references :purchase_recode, foreign_key: true

      t.timestamps
    end
  end
end
