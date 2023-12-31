require_relative './app/models/meal.rb'
require_relative './app/repositories/meal.rb'
require_relative './app/controllers/meal.rb'
require_relative './app/models/customer.rb'
require_relative './app/repositories/customer.rb'
require_relative './app/controllers/customer.rb'
require_relative './app/models/employee.rb'
require_relative './app/controllers/sessions_controller.rb'
require_relative './app/repositories/employee_repository.rb'
require_relative './app/models/order.rb'
require_relative './app/repositories/order_repository.rb'
require_relative './app/controllers/order_controller.rb'
require_relative './router.rb'

meals_filepath = File.join(__dir__, 'data/meals.csv')
customers_filepath = File.join(__dir__, 'data/customers.csv')
employees_filepath = File.join(__dir__, 'data/employees.csv')
orders_filepath = File.join(__dir__, 'data/orders.csv')

meal_repository = MealRepository.new(meals_filepath)
meal_controller = MealController.new(meal_repository)

customer_repository = CustomerRepository.new(customers_filepath)
customer_controller = CustomerController.new(customer_repository)

employee_repository = EmployeeRepository.new(employees_filepath)
sessions_controller = SessionsController.new(employee_repository)

order_repository = OrderRepository.new(orders_filepath, meal_repository, customer_repository, employee_repository)
order_controller = OrderController.new(order_repository, meal_repository, customer_repository, employee_repository)

router = Router.new(meal_controller, customer_controller, sessions_controller, order_controller)

router.run
