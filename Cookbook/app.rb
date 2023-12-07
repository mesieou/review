require_relative './app/models/meal.rb'
require_relative './app/repositories/meal_repository.rb'

filepath = File.join(__dir__, 'data/meals.csv')

puts "creating a rep"
p meal_repo = MealRepository.new(filepath)
puts "--------------"


puts "creating a new burger"
burger = Meal.new(id: 12, name: "Cheese burger", price: 235.8)
p meal_repo.create(burger)
puts "--------------"

puts "seeing all burgers"
meal_repo.all
puts "--------------"

puts "finding a burger"
meal_repo.find(2)
puts "--------------"
