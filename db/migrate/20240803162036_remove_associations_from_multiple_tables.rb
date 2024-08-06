class RemoveAssociationsFromMultipleTables < ActiveRecord::Migration[7.1]
  def change
    remove_reference :survey_questions, :order, index: true, foreign_key: true
    remove_reference :items, :business, index: true, foreign_key: true
  end
end
