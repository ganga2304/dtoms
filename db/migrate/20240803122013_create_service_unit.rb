class CreateServiceUnit < ActiveRecord::Migration[7.1]
  def change
    create_table :service_units do |t|
      t.string :name,null:false
      t.text :description
      t.references :business,null:false,foreign_key:true
      t.boolean :active, default: true
      t.string :number, null: false
      t.string :start_time
      t.string :end_time
      t.references :default_truck, null: false, foreign_key: { to_table: :trucks }
      t.references :default_driver, null: false, foreign_key: { to_table: :drivers }
      t.timestamps
    end
    add_index :service_units, :name, unique: true
    add_index :service_units, :number, unique: true
  end
end
