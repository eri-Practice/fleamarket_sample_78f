class ChangeColumnToprofile < ActiveRecord::Migration[6.0]
  def change
    change_column :profiles, :first_name, :string, null: false
    change_column :profiles, :family_name, :string, null: false
    change_column :profiles, :first_name_kana, :string, null: false
    change_column :profiles, :family_name_kana, :string, null: false
    change_column :profiles, :birth_date, :date, null: false
  end
end