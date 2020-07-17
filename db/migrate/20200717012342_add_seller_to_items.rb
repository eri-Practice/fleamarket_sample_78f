class AddSellerToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :seller, foreign_key: { to_table: :users }
    add_column :items, :seller
  end
end
