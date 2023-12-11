require_relative '../views/meal.rb'

class MealController
  def initialize(repo)
    @meal_repository = repo
    @view = View.new
  end

  def add
    name = ask_for(:name)
    price = ask_for(:price)
    meal_instance = Meal.new(name: name, price: price)
    @meal_repository.create(meal_instance)
    @view.confirm_created(:meal, meal_instance)
  end

  def list
    meal_instances = @meal_repository.all
    @view.display_meals(meal_instances)
  end

  def edit
    list
    index = @view.ask_for_index(:meal, :create)
    attr_to_edit_index = @view.ask_for_attritube_to_edit
    new_value = @view.ask_for_new_value(attr_to_edit_index)
    @meal_repository.edit(index, attr_to_edit_index, new_value)
    meal_instance = @meal_repository.find(index)
    @view.confirm_updated(:meal, meal_instance)
  end

  def destroy
    list
    index = @view.ask_for_index(:meal, :delete)
    @meal_repository.delete(index)
    @view.confirm_deleted
  end
end
