class Route < ApplicationRecord
    belongs_to :service_unit
    belongs_to :truck
    belongs_to :driver
end
