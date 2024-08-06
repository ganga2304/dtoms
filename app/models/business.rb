class Business < ApplicationRecord
    # enum business_type: { small_scale: "small scale", medium_scale: "medium scale", large_scale: "large_scale" }
    has_many :drivers
    has_many :orders
    has_many :service_units
    has_many :survey_answers, through: :orders
    has_many :accounts
    accepts_nested_attributes_for :accounts, allow_destroy: true

end
