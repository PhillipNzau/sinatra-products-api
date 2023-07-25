class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purcheses do |t|
      t.integer :quantity
      t.float :supplier_price
      t.integer :product_id
      t.integer :supplier_id
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end
  end
end
