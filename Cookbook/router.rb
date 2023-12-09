class Router
  def initialize(meal_controller, customer_controller, sessions_controller)
    @meal_controller = meal_controller
    @customer_controller = customer_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    current_employee = @sessions_controller.login
    welcome
    while @running
      if current_employee.manager?
        manager_menu
        user_action = gets.chomp.to_i
        manager_action(user_action)
      else
        driver_menu
        user_action = gets.chomp.to_i
        driver_action(user_action)
      end
    end
  end

  def welcome
    puts "Welcome to \"Juan's Kitchen\""
    puts '-------------------------'
  end

  def manager_menu
    puts ''
    puts 'What would you like to do?'
    puts '1 - Add a new meal'
    puts '2 - See all meals'
    puts '3 - Edit a meal'
    puts '4 - Delete a meal'
    puts '5 - Add a new customer'
    puts '6 - See all customers'
    puts '7 - Edit a customer'
    puts '8 - Delete a customer'
    puts '9 - Exit'
  end

  def driver_menu
    puts ''
    puts 'What would you like to do?'
    puts '1 - Add a new meal'
    puts '2 - See all meals'
    puts '3 - Edit a meal'
    puts '4 - Delete a meal'
    puts '5 - Exit'
  end

  def manager_action(user_action)
    case user_action
    when 1 then @meal_controller.add
    when 2 then @meal_controller.list
    when 3 then @meal_controller.edit
    when 4 then @meal_controller.destroy
    when 5 then @customer_controller.add
    when 6 then @customer_controller.list
    when 7 then @customer_controller.edit
    when 8 then @customer_controller.destroy
    when 9 then stop
    end
  end

  def driver_action(user_action)
    case user_action
    when 1 then @meal_controller.add
    when 2 then @meal_controller.list
    when 3 then @meal_controller.edit
    when 4 then @meal_controller.destroy
    when 5 then stop
    end
  end

  def stop
    @running = false
  end
end
