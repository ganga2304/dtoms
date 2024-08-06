# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clear existing data
Schedule.destroy_all
Route.destroy_all
ServiceUnit.destroy_all
Truck.destroy_all
Driver.destroy_all
SurveyAnswer.destroy_all
SurveyQuestion.destroy_all
Item.destroy_all
Order.destroy_all
CustomerAddress.destroy_all
Customer.destroy_all
Account.destroy_all
Business.destroy_all


# Create Businesses
10.times do
  Business.create!(
    name: Faker::Company.name,
    code: Faker::Alphanumeric.unique.alphanumeric(number: 8).upcase,
    active: [true, false].sample
  )
end

# Create Accounts
20.times do
  Account.create!(
    name: Faker::Name.name,
    active: [true, false].sample,
    business_id: Business.order('RAND()').first.id
  )
end

# Create Customers
50.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    business_id: Business.order('RAND()').first.id,
    active: [true, false].sample,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.unique.phone_number,
    phone_number_2: Faker::PhoneNumber.phone_number,
    phone_number_3: Faker::PhoneNumber.phone_number
  )
end

# Create Customer Addresses
100.times do
  CustomerAddress.create!(
    customer_id: Customer.order('RAND()').first.id,
    address_line_1: Faker::Address.street_address,
    address_line_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip_code
  )
end

# Create Orders
100.times do
  Order.create!(
    customer_id: Customer.order('RAND()').first.id,
    order_date: Faker::Date.backward(days: 30),
    status: %w[pending completed].sample,
    business_id: Business.order('RAND()').first.id,
    active: [true, false].sample,
    account_id: Account.order('RAND()').first.id,
    number: Faker::Alphanumeric.unique.alphanumeric(number: 10).upcase,
    time_window_start: Faker::Time.forward(days: 1, period: :morning),
    time_window_end: Faker::Time.forward(days: 1, period: :evening),
    description: Faker::Lorem.sentence
  )
end

# Create Items
200.times do
  Item.create!(
    order_id: Order.order('RAND()').first.id,
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    serial_number: SecureRandom.hex(6),
    quantity: Faker::Number.between(from: 1, to: 100),
    weight: Faker::Number.decimal(l_digits: 2, r_digits: 1),
    amount: Faker::Commerce.price(range: 1.0..100.0),
    setup_time: Faker::Number.between(from: 10, to: 120)
  )
end

# Create Survey Questions
50.times do
  SurveyQuestion.create!(
    business_id: Business.order('RAND()').first.id,
    account_id: Account.order('RAND()').first.id,
    active: [true, false].sample,
    content: Faker::Lorem.unique.sentence
  )
end

# Create Survey Answers
200.times do
  begin
  SurveyAnswer.create!(
    order_id: Order.order('RAND()').first.id,
    customer_id: Customer.order('RAND()').first.id,
    survey_question_id: SurveyQuestion.order('RAND()').first.id,
    response: Faker::Lorem.paragraph
  )
  rescue => e
  end
end

# Create Drivers
30.times do
  Driver.create!(
    name: Faker::Name.name,
    business_id: Business.order('RAND()').first.id,
    active: [true, false].sample,
    license_number: Faker::DrivingLicence.unique.british_driving_licence,
    license_state: Faker::Address.state,
    account_id: Account.order('RAND()').first.id,
    description: Faker::Lorem.sentence,
    contact_number: Faker::PhoneNumber.phone_number
  )
end

# Create Trucks
30.times do
  Truck.create!(
    truck_number: Faker::Vehicle.unique.license_plate,
    business_id: Business.order('RAND()').first.id,
    account_id: Account.order('RAND()').first.id,
    active: [true, false].sample,
    maximum_load: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    maximum_weight: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  )
end

# Create Service Units
20.times do
  begin
  ServiceUnit.create!(
    name: Faker::Commerce.department,
    description: Faker::Lorem.paragraph,
    business_id: Business.order('RAND()').first.id,
    active: [true, false].sample,
    service_unit_number: Faker::Alphanumeric.unique.alphanumeric(number: 5).upcase,
    start_time: Faker::Time.backward(days: 1, period: :morning),
    end_time: Faker::Time.backward(days: 1, period: :evening),
    default_truck_id: Truck.order('RAND()').first.id,
    default_driver_id: Driver.order('RAND()').first.id,
    account_id: Account.order('RAND()').first.id
  )
rescue 
end
end

# Create Routes
50.times do
	begin
  Route.create!(
    service_unit_id: ServiceUnit.order('RAND()').first.id,
    truck_id: Truck.order('RAND()').first.id,
    driver_id: Driver.order('RAND()').first.id,
    date: Faker::Date.backward(days: 30),
    start_time: Faker::Time.backward(days: 1, period: :morning),
    end_time: Faker::Time.backward(days: 1, period: :evening),
    total_distance: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    job_start: Faker::Time.backward(days: 1, period: :morning),
    job_finish: Faker::Time.backward(days: 1, period: :evening),
    route_locked: [true, false].sample
  )
rescue 
end
end

# Create Schedules
100.times do
  Schedule.create!(
    service_unit_id: ServiceUnit.order('RAND()').first.id,
    order_id: Order.order('RAND()').first.id,
    route_id: Route.order('RAND()').first.id,
    date: Faker::Date.forward(days: 30),
    start_time: Faker::Time.forward(days: 1, period: :morning).to_s,
    end_time: Faker::Time.forward(days: 1, period: :evening).to_s,
    stop_number: rand(0..10).to_s
  )
end

# Create Categories
10.times do
  Category.create(name: Faker::Commerce.department)
end

# Fetch all categories
categories = Category.all

# Assign categories to existing items
Item.find_each do |item|
  # Randomly assign 1 to 3 categories to each item
  item.categories = categories.sample(rand(1..3))
end
# Fetching all accounts and drivers
accounts = Account.all
drivers = Driver.all

# Example: Assign each driver to a random set of accounts
drivers.each do |driver|
  # Pick a random number of accounts (between 1 and the total number of accounts)
  random_accounts = accounts.sample(rand(1..accounts.size))
  
  # Associate the driver with the selected accounts
  driver.accounts = random_accounts
  driver.save
end

# Example: Assign each account to a random set of drivers
accounts.each do |account|
  # Pick a random number of drivers (between 1 and the total number of drivers)
  random_drivers = drivers.sample(rand(1..drivers.size))
  
  # Associate the account with the selected drivers
  account.drivers = random_drivers
  account.save
end

# Fetching all accounts and trucks
accounts = Account.all
trucks = Truck.all

# Example: Assign each truck to a random set of accounts
trucks.each do |truck|
  # Pick a random number of accounts (between 1 and the total number of accounts)
  random_accounts = accounts.sample(rand(1..accounts.size))
  
  # Associate the truck with the selected accounts
  truck.accounts = random_accounts
  truck.save
end

# Example: Assign each account to a random set of trucks
accounts.each do |account|
  # Pick a random number of trucks (between 1 and the total number of trucks)
  random_trucks = trucks.sample(rand(1..trucks.size))
  
  # Associate the account with the selected trucks
  account.trucks = random_trucks
  account.save
end


puts "Seeding completed!"