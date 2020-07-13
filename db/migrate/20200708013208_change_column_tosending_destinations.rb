class ChangeColumnTosendingDestinations < ActiveRecord::Migration[6.0]
  def change
    change_column :sending_destinations, :destination_first_name, :string, null: false
    change_column :sending_destinations, :destination_family_name, :string, null: false
    change_column :sending_destinations, :destination_first_name_kana, :string, null: false
    change_column :sending_destinations, :destination_family_name_kana, :string, null: false
    change_column :sending_destinations, :post_code, :integer, null: false
    change_column :sending_destinations, :city, :string, null: false
    change_column :sending_destinations, :house_number, :string, null: false
    change_column :sending_destinations, :building_name, :string, null: true
    change_column :sending_destinations, :phone_number, :integer, null: true
    change_column :sending_destinations, :prefecture_code, :string, null: false
  end
end
