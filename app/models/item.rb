class Item < ApplicationRecord
  belongs_to :order
  has_and_belongs_to_many :categories
end