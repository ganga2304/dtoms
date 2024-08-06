class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :full_name, null:false
      t.references :business, foreign_key: true
      t.boolean :active
      t.string :email, null:false
      t.string :phone_number, null:false
      t.timestamps
    end
    add_index :customers, :email, unique: true
    add_index :customers, :phone_number, unique: true
  end
end
