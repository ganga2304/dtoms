class Createitems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :orders, null: false, foreign_key: true
      t.string :name
      t.text :description, null:false
      t.string :serial_number, null:false
      t.integer :quantity, default: 0
      t.decimal :weight
      t.decimal :amount
      t.timestamps
    end
    add_index :items, :serial_number, unique: true
  end
end
