class BusinessNotification < Notification
    
    enum priority_level: { low: 'low', medium: 'medium', high: 'high' }
end