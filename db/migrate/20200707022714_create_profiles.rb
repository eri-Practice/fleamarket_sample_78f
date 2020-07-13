class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :family_name
      t.string :first_name_kana
      t.string :family_name_kana
      t.date :birth_date
      t.references :user, null: false, foreign_key: :user_id

      t.timestamps
    end
  end
end
