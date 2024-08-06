class ChangesInItemTable < ActiveRecord::Migration[7.1]
  def change
  remove_reference :items, :orders,index:true, foreign_key: true
  add_reference :items,:order,null: false, foreign_key: true

  end
end
