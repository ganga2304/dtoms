class AddReferencesAndIndexesToMultipleTables < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :business,null: false,foreign_key: true
    add_reference :items, :business,null: false,foreign_key: true
    add_reference :service_units, :account, null: false, foreign_key: true
  end
end
