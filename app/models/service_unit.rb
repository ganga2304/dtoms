class ServiceUnit < ApplicationRecord
    belongs_to :business
    belongs_to :default_truck, class_name: 'Truck', foreign_key: 'default_truck_id'
    belongs_to :default_driver, class_name: 'Driver', foreign_key: 'default_driver_id'
    has_many :routes, dependent: :destroy
    has_many :drivers, through: :routes
    has_many :trucks, through: :routes


end