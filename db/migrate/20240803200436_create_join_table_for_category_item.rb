class CreateJoinTableForCategoryItem < ActiveRecord::Migration[7.1]
  def change
    create_join_table :items, :categories
      # t.index [:item_id, :category_id]
      # t.index [:category_id, :item_id]
    
  end
end
