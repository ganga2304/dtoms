class CreateBusinesses < ActiveRecord::Migration[7.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :code,null:false
      t.string :business_type
      t.boolean :active
      t.timestamps
    end
    add_index :businesses, :code, unique: true
  end
end
