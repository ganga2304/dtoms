class AddIndexToMultipleTables < ActiveRecord::Migration[7.1]
   def change
   add_index :businesses, :business_type

    add_index :accounts, :active

    add_index :customers, :full_name
    add_index :customers, [:business_id, :full_name]

    add_index :customer_addresses, :zip
    add_index :customer_addresses, [:address_line_1, :city, :state, :zip], length: { address_line_1: 100, city: 20, state: 20, zip: 10 }

    add_index :orders, [:business_id, :active, :status]
    add_index :orders, [:business_id, :order_date]


    add_index :trucks, :active
    add_index :trucks, [:truck_number,:business_id]

    add_index :routes, :date 
    add_index :routes, [:service_unit_id,:date]

    add_index :service_units, [:business_id, :active]

    add_index :schedules, [:date, :service_unit_id]
  end
end
