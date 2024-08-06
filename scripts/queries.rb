#=====================Simple Queries================

#Fetch all active businesses.

businesses = Business.where( active: true )

# Fetch all orders for a specific customer.

customer = Customer.all.sample.orders

#Fetch all drivers for a business.

business = Business.all.sample.drivers


# Fetch all items for a specific order.

order = Order.all.sample.items

# Fetch all customers and their orders.
all_customers_orders = Customer.includes(:orders)

# Fetch all orders with their items.
all_orders_items = Order.includes(:items)

# Fetch all active orders and their associated businesses.
active_orders_businesses = Order.where(active: true).includes(:business)

# Fetch all service units for a business with their default trucks and drivers.
business = Business.all.sample.service_units.includes(:default_truck, :default_driver)

# Fetch all orders and group them by business. 
orders_by_business = Order.includes(:business).group_by(&:business)

#Fetch all items with their order, business, and customer information.
items_with_order_business_customer = Item.includes(order: [ :business, :customer ])


#==============================Intermediate Queries:================================


#Fetch all survey answers for a specific order and include the associated survey questions.
order = Order.all.sample.survey_answers.includes(:survey_question)

#Fetch all customers who have placed orders in the last month.
last_month_orders = Customer.joins(:orders).where("orders.order_date >=?",1.month.ago)

#Fetch all orders with their customer and business, sorted by order date.
orders_with_customer_business = Order.includes(:customer, :business).order(order_date: :desc)

#Fetch all survey answers for a specific business, including the order and customer.
business = Business.all.sample.survey_answers.includes(:order, :customer)


# ======================Advanced Queries:===========================

#Fetch all routes with their service units, trucks, and drivers.
routes = Route.includes(service_unit: [:default_truck, :default_driver])


#Fetch all trucks and the number of routes they are assigned to.
trucks_with_route_count = Truck.includes(:routes).group("trucks.id").count("routes.id")

#Fetch all customers with more than one order.
customers_with_multiple_orders = Customer.joins(:orders).group("customers.id").having("count(orders.id) > 1")

#Fetch all drivers and their total assigned routes, only for active businesses. -- doubt
drivers_with_active_business_routes = Driver.joins(routes: { service_unit: :business })
                                             .where(businesses: { active: true })


#  Fetch all orders and calculate the total amount for each order, grouped by business.
orders_with_total_amount = Order.joins(:items, :business).group('businesses.id').sum('items.amount')


#Fetch the total quantity of items ordered by each customer.
items_ordered_by_customer = Customer.joins(orders: :items).group('customers.id').sum('items.qunatity')


#Fetch the total distance covered by all routes, grouped by service unit.
routes_distance_by_service_unit = Route.joins(:service_unit).group('service_units.id').sum("routes.total_distance")

