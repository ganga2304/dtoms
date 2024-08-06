class AddParentCategoryIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :parent_category_id, :bigint
    add_index :categories, :parent_category_id
    add_foreign_key :categories, :categories, column: :parent_category_id
  
  end
end
