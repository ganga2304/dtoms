class AddConstraintToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    change_column_null :businesses, :name, false

    change_column_default :customers, :active, from: nil, to: true

    change_column_null :orders, :number, false
    add_index :orders, :number, unique: true

    change_column :items, :weight, :decimal, default: 0.0, precision: 4, scale: 1
    change_column :items, :amount, :decimal, default: 0.0, precision: 7, scale: 2

    remove_index :routes, column: [:service_unit_id, :date]
    add_index :routes, [:service_unit_id, :date], unique: true

    add_index :survey_answers, [:survey_question_id, :order_id], unique: true
  end
end
