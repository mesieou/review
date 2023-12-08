require_relative '../views/meal.rb'

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

  def edit
    list
    index = @view.ask_for_meal_index
    attr_to_edit_index = @view.ask_for_attritube_to_edit
    new_value = @view.ask_for_new_value(attr_to_edit_index)
    @meal_repository.edit(index, attr_to_edit_index, new_value)
    meal_instance = @meal_repository.find(index)
    @view.confirm_meal_updated(meal_instance)
  end
end
