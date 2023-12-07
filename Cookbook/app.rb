require_relative './app/models/meal.rb'
require_relative './app/repositories/meal_repository.rb'
require_relative './app/controllers/meal_controller.rb'
require_relative './router.rb'

filepath = File.join(__dir__, 'data/meals.csv')
meal_repository = MealRepository.new(filepath)
meal_controller = MealController.new(meal_repository)
router = Router.new(meal_controller)

router.run
