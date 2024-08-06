class Notification < ApplicationRecord
  self.inheritance_column = :notifiable_type
end