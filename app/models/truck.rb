class Truck < ApplicationRecord
    has_many :routes
    has_many :service_units, through: :routes
    has_and_belongs_to_many :accounts, join_table: :specific_account_trucks

end
