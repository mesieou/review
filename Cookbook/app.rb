require_relative './app/models/meal.rb'
require_relative './app/repositories/meal_repository.rb'

filepath = File.join(__dir__, 'data/meals.csv')

meal_repo = MealRepository.new(filepath)
hawaii_meal = Meal.new(price: 11, name: "Hawaii")
meal_repo.create(hawaii_meal)
p hawaii_meal.id == 1
