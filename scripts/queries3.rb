#Create a Business record with nested Accounts records.
new_business = Business.create(
    name: "one business",
    active: true,
    code: "KOLHIU5X",
    accounts_attributes: [{
        name: "B45DES",
        active: true
    }]

)

#Write a query to list all notifications specifically for customers.
    CustomerNotification.all


#Implement a functionality to delete all customer notifications when a customer is deleted.
# Create a customer with all details
customer = Customer.create(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com",
  phone_number: "123-456-7890",
  phone_number_2: "234-567-8901",
  phone_number_3: "345-678-9012",
  active: true,
  business_id: 1 # assuming there's a Business with ID 1
)

# Create notifications for the customer
CustomerNotification.create(message: "Welcome notification", notifiable: customer)
CustomerNotification.create(message: "Reminder notification", notifiable: customer)

# Check notifications count before deletion
puts "Notifications count before deletion: #{CustomerNotification.count}" # Should be 2

# Delete the customer
customer.destroy

# Check notifications count after deletion
puts "Notifications count after deletion: #{CustomerNotification.count}" # Should be 0


#Add custom attributes specific to different notification types and implement methods in class to utilize these attributes.







