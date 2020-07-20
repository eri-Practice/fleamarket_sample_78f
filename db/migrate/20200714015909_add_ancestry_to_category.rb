class AddAncestryToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :ancestry, :string
    add_column :categories, :name, :string
    add_index :categories, :ancestry
  end
end
