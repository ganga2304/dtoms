class SurveyAnswer< ApplicationRecord
    belongs_to :order
    belongs_to :survey_question
    belongs_to :customer
end