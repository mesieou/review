class View

  # Ask information to customers
  def ask_for_meal_details
    puts 'Meal name:'
    meal_name = gets.chomp
    puts 'Meal price:'
    meal_price = gets.chomp.to_f
    { name: meal_name, price: meal_price }
  end

  def ask_for_attritube_to_edit
    puts ''
    puts 'Type 1 to edit the name'
    puts 'Type 2 to edit the price'
    gets.chomp.to_i
  end

  def ask_for_meal_index
    puts ''
    puts 'Type the meal number you would like to change'
    gets.chomp.to_i
  end

  def ask_for_new_value(attr_to_edit_index)
    puts ''
    if attr_to_edit_index == 1
      puts 'Type the new name'
      gets.chomp
    else
      puts 'Type the new price'
      gets.chomp.to_f
    end
  end

  # Display messages to customer
  def display_meal(meal_instance)
    puts ''
    puts "#{meal_instance.id} - Name: #{meal_instance.name}"
    puts "Price: #{meal_instance.price}\n"
  end

  def display_meals(meal_instances)
    meal_instances.each do |meal_instance|
      display_meal(meal_instance)
    end
  end

  # Confirmations to customer
  def confirm_meal_created(meal_instance)
    puts ''
    puts 'Success!. Meal created:'
    display_meal(meal_instance)
  end

  def confirm_meal_updated(meal_instance)
    puts ''
    puts 'Success!. Meal updated:'
    display_meal(meal_instance)
  end
end
