class AddColumnsToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :phone_number_2, :string
    add_column :customers, :phone_number_3, :string
    add_column :customers, :last_name, :string

    add_column :orders, :description, :text

    add_column :drivers, :contact_number, :string

    add_column :items, :setup_time, :integer
  end
end
