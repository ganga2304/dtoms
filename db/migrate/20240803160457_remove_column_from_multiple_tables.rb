class RemoveColumnFromMultipleTables < ActiveRecord::Migration[7.1]
  def change
    remove_column :businesses, :business_type, :string
    remove_column :survey_answers, :rating, :integer
    
  end
end
