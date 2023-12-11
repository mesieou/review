require_relative './base_view.rb'
class CustomerView < BaseView
  # Ask information to the customer
  def ask_for_attritube_to_edit
    puts ''
    puts 'Type 1 to edit the name'
    puts 'Type 2 to edit the address'
    gets.chomp.to_i
  end

  def ask_for_new_value(attr_to_edit_index)
    puts ''
    if attr_to_edit_index == 1
      puts 'Type the new name:'
      gets.chomp
    else
      puts 'Type the new address:'
      gets.chomp
    end
  end

  # Display messages to customer
  def display_instance(customer_instance, index)
    puts ''
    puts "#{index + 1} - Name: #{customer_instance.name}"
    puts "Address: #{customer_instance.address}\n"
  end

  def display_all(customer_instances)
    customer_instances.each_with_index do |customer_instance, index|
      display_instance(customer_instance, index)
    end
  end
end
