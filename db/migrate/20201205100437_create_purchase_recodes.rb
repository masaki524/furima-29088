class CreatePurchaseRecodes < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_recodes do |t|

      t.timestamps
    end
  end
end
