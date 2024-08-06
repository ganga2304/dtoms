class CreateCustomerAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :customer_addresses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :address_line_1, null:false
      t.string :address_line_2, null:false
      t.string :city
      t.string :state
      t.string :zip
      t.timestamps
    end

  end
end
