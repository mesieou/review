require_relative '../views/order_view.rb'
class OrderController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_view = OrderView.new
  end

  def add
    meals = @meal_repository.all
    meals.display_meals(meals)
    order_view.ask_for(:meal)
  end
end
