class Router
  def initialize(meal_controller)
    @meal_controller = meal_controller
    @running = true
  end

  def run
    puts "Welcome to \"Juan's Kitchen\""
    puts '-------------------------'

    while @running
      display_tasks
      user_action = gets.chomp.to_i
      route_action(user_action)
    end
  end

  def display_tasks
    puts ''
    puts 'What would you like to do?'
    puts '1 - Add a new meal'
    puts '2 - See all meals'
    puts '3 - Find a meal'
    puts '4 - Exit'
  end

  def route_action(user_action)
    case user_action
    when 1 then @meal_controller.add
    when 2 then @meal_controller.list
    when 4 then stop
    end
  end

  def stop
    @running = false
  end
end
