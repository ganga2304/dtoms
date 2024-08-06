class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :service_unit, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :order_number
      t.timestamps
    end
  end
end
