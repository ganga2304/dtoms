class CreateSurveyAnswer < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_answers do |t|
      t.references :order, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :survey_question, null: false, foreign_key: true
      t.text :response, null: false
      t.integer :rating
      t.timestamps
    end
  end
end
