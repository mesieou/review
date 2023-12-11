require_relative './base_view.rb'
class View < BaseView
  # Ask information to customers
  def ask_for_attritube_to_edit
    puts ''
    puts 'Type 1 to edit the name'
    puts 'Type 2 to edit the price'
    gets.chomp.to_i
  end

  def ask_for_new_value(attr_to_edit_index)
    puts ''
    if attr_to_edit_index == 1
      puts 'Type the new name:'
      gets.chomp
    else
      puts 'Type the new price:'
      gets.chomp.to_f
    end
  end

  # Display messages
  def display_instance(meal_instance, index)
    puts ''
    puts "#{index + 1} - Name: #{meal_instance.name}"
    puts "Price: #{meal_instance.price}\n"
  end

  def display_all(meal_instances)
    meal_instances.each_with_index do |meal_instance, index|
      display_instance(meal_instance, index)
    end
  end
end
