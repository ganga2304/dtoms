class Account < ApplicationRecord
    has_and_belongs_to_many :drivers
    has_and_belongs_to_many :trucks, join_table: :specific_account_trucks
    belongs_to :business


end
