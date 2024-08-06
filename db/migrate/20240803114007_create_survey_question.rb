class CreateSurveyQuestion < ActiveRecord::Migration[7.1]
  def change
    create_table :survey_questions do |t|
      t.references :business, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.boolean :active, default: true
      t.text :content
      t.timestamps
    end
    add_index :survey_questions, :content, unique: true, length:333
  end
end
