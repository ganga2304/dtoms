class CreateJoinTableForAccountsAndDrivers < ActiveRecord::Migration[7.1]
  def change
    create_join_table :accounts, :drivers
      # t.index [:account_id, :driver_id]
      # t.index [:driver_id, :account_id]
    
  end
end
