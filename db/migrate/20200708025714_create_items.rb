class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.integer :price
      t.integer :category
      t.string :condition
      t.string :postage_payer
      t.integer :prefecture
      t.string :standby_day	
      t.string :trading_status
      t.integer :seller
      t.integer :buyer	
      t.timestamps
    end
  end
end
