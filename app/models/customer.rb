class Customer < ApplicationRecord
    has_many :orders
    has_many :survey_answers
    has_many :notifications, as: :notifiable, dependent: :destroy

end
