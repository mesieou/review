require_relative '../views/order_view.rb'
class OrderController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_view = OrderView.new
    @meal_view = View.new
    @employee_view = EmployeeView.new
    @customer_view = CustomerView.new
  end

  def add
    meals = @meal_repository.all
    @meal_view.display_all(meals)
    meal_index = @meal_view.ask_for_index(:meal, :add)
    meal_instance = @meal_repository.find(meal_index)

    customers = @customer_repository.all
    @customer_view.display_all(customers)
    customer_index = @customer_view.ask_for_index(:customer, :add)
    customer_instance = @customer_repository.find(customer_index)

    employees = @employee_repository.all
    @employee_view.display_all(employees)
    employee_index = @employee_view.ask_for_index(:employee, :add)
    employee_instance = @employee_repository.find(employee_index)

    order = Order.new(meal: meal_instance, customer: customer_instance, employee: employee_instance)
    @order_repository.create(order)
    @order_view.confirm_created(:order, order)
  end

  def list
    orders = @order_repository.all
    @order_view.display_all(orders)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.all_undelivered
    @order_view.display_all(undelivered_orders)
  end

  def mark_as_delivered
    list
    index = @order_view.ask_for_index(:order, "mark as delivered")
    order_instance = @order_repository.find(index)
    @order_repository.mark_and_save_as_deliverded(order_instance)
    @order_view.confirm_updated(:order, order_instance)
  end
end
