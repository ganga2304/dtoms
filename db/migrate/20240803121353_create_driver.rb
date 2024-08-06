class CreateDriver < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :name, null: false
      t.references :business, null: false, foreign_key: true
      t.boolean :active, default: true
      t.string :license_number, null: false
      t.string :license_state, null: false
      t.references :account, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
    add_index :drivers, :license_number, unique: true
  end
end
