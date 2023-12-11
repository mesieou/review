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
  def display_customer(customer_instance)
    puts ''
    puts "#{customer_instance.id} - Name: #{customer_instance.name}"
    puts "Address: #{customer_instance.address}\n"
  end

  def display_customers(customer_instances)
    customer_instances.each do |customer_instance|
      display_customer(customer_instance)
    end
  end
end
