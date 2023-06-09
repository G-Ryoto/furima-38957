class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,                null:false 
      t.text :product_explanation,         null:false 
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_date_id
      t.integer :shipping_charge_id
      t.integer :prefecture_id
      t.integer :price, index: true
      t.references  :user,                null: false

      t.timestamps
    end
  end
end
