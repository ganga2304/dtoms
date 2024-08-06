class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, null:false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
