require_relative '../views/meal_view.rb'

class MealController
  def initialize(repo)
    @meal_repository = repo
    @view = View.new
  end

  def add
    meal_hash = @view.ask_for_meal_details
    meal_instance = Meal.new(meal_hash)
    @meal_repository.create(meal_instance)
    @view.confirm_meal_created(meal_instance)
  end

  def list
    meal_instances = @meal_repository.all
    @view.display_meals(meal_instances)
  end
end
