class Order < ApplicationRecord
    belongs_to :customer
    has_many :items
    belongs_to :business
    has_many :survey_answers
end
