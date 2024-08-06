class RenameColumnsInMultipleTables < ActiveRecord::Migration[7.1]
  def change
    rename_column :customers, :full_name, :first_name
    rename_column :schedules, :order_number, :stop_number
    rename_column :service_units, :number, :service_unit_number
    
  end
end
