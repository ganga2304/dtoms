#====================Queries Involving Many-to-Many Relationships==================

#---------------Easy Queries----------------

#Fetch all items for a specific category.
category = Category.all.sample.items

#Fetch all categories for a specific item.

item = Item.all.sample.categories

#Fetch all trucks for a specific service unit through routes.
service_unit = ServiceUnit.all.sample.trucks

#Create a new category and associate it with existing items.
new_category = Category.create(name: "New Category", description:"new cat data")

item = Item.first
item.categories << new_category

#Delete a category and remove its associations with items.
category = Category.last
category.destroy

#Update the name and description of a category.
category = Category.first
category.update(name: "Updated Category", description: "updated cat data")

#Fetch all drivers for a specific account.
account = Account.all.sample.drivers

#Fetch all accounts for a specific driver.
driver = Driver.all.sample.accounts

#Create a new account and associate it with existing drivers.
new_account = Account.create(name:"ganga",active: true,business_id: 8 )
driver_to_associate = Driver.last
new_account.drivers << driver_to_associate

#Delete an account and remove its associations with drivers.
account_to_delete = Account.last
account_to_delete.destroy

#Update the name and details of an account.
account = Account.first
account.update(name: "U.David Weimann",active: true,business_id: 2 )

#======================Intermediate Queries=================

#Fetch all items and their categories.
items_with_categories = Item.includes(:categories)

#Fetch all service units with their trucks and drivers through routes.
service_units_with_trucks_and_drivers = ServiceUnit.includes(:trucks ,:drivers)

#Fetch all categories and the number of items in each category.
categories_with_item_count = Category.includes(:items).group("categories.id").count("items.id")

#Create a new item and associate it with existing categories.
new_item = Item.create(
  order_id: 55,
  name: "fantastic rubber",
  description: "fantastic rubber description",
  serial_number: "0b742f0d52h",
  quantity: 67,
  weight: 86.3,
  amount: 78.97,
  setup_time: 56
)
#Delete an item and remove its associations with categories.
item_to_delete = Item.last
item_to_delete.destroy
#Update the details of an item and its associated categories.
item = Item.last
item.update(
  order_id: 55,
  name: "updated Heavy Duty Leather Computer",
  description: "updated Rerum qui ducimus. Delectus reprehenderit itaque. Enim suscipit maiores.",
  serial_number: "0b742f0d52h",
  quantity: 67,
  weight: 86.3,
  amount: 78.97,
  setup_time: 56
)

    
#Fetch all drivers and their associated accounts.
drivers = Driver.includes(:accounts)

#Fetch all accounts and the number of drivers associated with each account.
accounts = Account.includes(:drivers).group("accounts.id").count("drivers.id")

#Create a new driver and associate it with existing accounts.
new_driver = Driver.create(
    name: "D.Emmett",
    business_id: 3,
    active: true,
    license_number: "GANL9003141WY8XM",
    license_state: "GA",
    account_id: 6,
    description: "about D.Emmett"
    )

 #Delete a driver and remove its associations with accounts.
 driver_to_delete = Driver.last
 driver_to_delete.destroy
   
#Update the details of a driver and its associated accounts.
driver = Driver.last
driver.last.update(name:"pratham")


#======================Advanced Queries===================

#Fetch all items with their categories, and sort by item name.
items_with_categories = Item.includes(:categories).order("items.name ")

#Fetch all service units, their trucks, and drivers, including the total distance covered by each route.---doubt
service_units = ServiceUnit


#Fetch all categories with the average, minimum, and maximum quantity of items in each category.
categories = Category.joins(:items).select('categories.*,
AVG(items.quantity) AS avg_quantity, 
MIN(items.quantity) AS min_quantity,
MAX(items.quantity) AS max_quantity').group('categories.id')

#Create a new service unit and associate it with trucks and drivers through routes.
new_service_unit = ServiceUnit.create(
    name: "new Service unit",
    description: "new Service unit description",
    business_id: 5,
    account_id: 5,
    service_unit_number: "GB23041",
    start_time: "6:00", 
    end_time: "13.00",
    default_truck_id: Truck.last.id,
    default_driver_id: Driver.last.id
)
route = Route.create(
      service_unit_id: ServiceUnit.last.id,
      truck_id: 1,
      driver_id: 2,
      date: Date.today,
      start_time: "08:00",
      end_time: "18:00",
      total_distance: Faker::Number.decimal(l_digits: 2, r_digits: 2),
      job_start: DateTime.now,
      job_finish: DateTime.now + 8.hours,
      route_locked: [true, false].sample
)
new_service_unit.routes << route

#Delete a service unit and remove its associations with trucks and drivers.
service_unit = ServiceUnit.last
service_unit.routes.destroy_all
service_unit.destroy


#Fetch all accounts with the number of trucks associated with each account.
accounts = Account.includes(:trucks).group('accounts.id').count('trucks.id')


#Fetch all trucks and the total number of accounts they are associated with.
trucks = Truck.includes(:accounts).group('trucks.id').count('accounts.id')


#Create a new truck and associate it with existing accounts.

new_truck = Truck.create(
  truck_number: 'GBN3456',         
  business_id: 6,                  
  account_id: 1,                   
  active: true,                   
  maximum_load: 150.00,          
  maximum_weight: 300.00     
)

Account.last.trucks << new_truck

#Delete a truck and remove its associations with accounts.
truck = Truck.last
truck.accounts.destroy_all
truck.destroy


