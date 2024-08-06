class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.references :service_unit, null: false, foreign_key: true
      t.references :truck, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.date :date
      t.string :start_time
      t.string :end_time
      t.integer :total_distance
      t.datetime :job_start
      t.datetime :job_finish
      t.boolean :route_locked, default:false
      t.timestamps
    end
  end
end
