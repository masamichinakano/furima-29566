class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.integer :price, null:false
      t.text :text, null:false
      t.integer :category_id, null:false
      t.integer :product_status_id, null:false
      t.integer :shipping_fee_id, null:false
      t.integer :prefectures_id, null:false
      t.integer :shipping_date_id, null:false
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
