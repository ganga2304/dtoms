class CreateTruck < ActiveRecord::Migration[7.1]
  def change
    create_table :trucks do |t|
      t.integer :truck_number, null: false
      t.references :business, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.boolean :active, default: true
      t.decimal :maximum_load, precision: 5, scale: 2
      t.decimal :maximum_weight, precision: 5, scale: 2
      t.timestamps
    end
    add_index :trucks, :truck_number, unique: true
  end
end
