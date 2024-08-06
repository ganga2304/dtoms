class CustomerNotification < Notification
    scope :unread, -> { where(read_status: false) }
end