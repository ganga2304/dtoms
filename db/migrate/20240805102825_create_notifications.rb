class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.string :notifiable_type
      t.integer :notifiable_id
      t.boolean :read_status, default: false 
      t.string :priority_level
      t.timestamps
    end
  end
end
