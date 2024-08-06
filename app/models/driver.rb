class Driver < ApplicationRecord
    belongs_to :business
    has_many :routes
    has_many :service_units, through: :routes
    has_and_belongs_to_many :accounts



end