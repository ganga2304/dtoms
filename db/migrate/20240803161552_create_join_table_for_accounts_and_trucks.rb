class CreateJoinTableForAccountsAndTrucks < ActiveRecord::Migration[7.1]
  def change
    create_join_table :accounts, :trucks, table_name: :specific_account_trucks 
 
      # t.index [:account_id, :truck_id]
      # t.index [:truck_id, :account_id]
    
  end
end
