class View
  def ask_for_meal_details
    puts 'Meal name:'
    meal_name = gets.chomp
    puts 'Meal price:'
    meal_price = gets.chomp.to_f
    { name: meal_name, price: meal_price }
  end

  def display_meal(meal_instance)
    puts ''
    puts "Meal name: #{meal_instance.name}"
    puts "Price: #{meal_instance.price}\n"
  end

  def display_meals(meal_instances)
    meal_instances.each do |meal_instance|
      display_meal(meal_instance)
    end
  end

  def confirm_meal_created(meal_instance)
    puts ''
    puts 'Success!. Meal created:'
    display_meal(meal_instance)
  end
end
