class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null:false,foreign_key: true
      t.datetime :order_date
      t.string :status
      t.references :business, null:false,foreign_key: true
      t.boolean :active, default: true
      t.references :account, null:false, foreign_key: true
      t.string :number
      t.string :time_window_start
      t.string :time_window_end

      t.timestamps
    end
  end
end
