class ChangeDataTypesFromMultipleTables < ActiveRecord::Migration[7.1]
  def change

    change_column :trucks, :truck_number, :string

    change_column :routes, :total_distance, :decimal,precision:5, scale:2

    change_column :schedules, :start_time, :string
    change_column :schedules, :end_time, :string
  end
end
