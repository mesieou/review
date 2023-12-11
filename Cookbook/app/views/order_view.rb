require_relative './base_view.rb'
class OrderView < BaseView
  # Display messages to customer
  def display_instance(order_instance)
    puts ''
    puts "#{order_instance.id} - Meal: #{order_instance.meal.name}"
    puts "Price: #{order_instance.meal.price}\n"
    puts "Customer: #{order_instance.customer.name}\n"
    puts "Address: #{order_instance.customer.address}\n"
    puts "Driver: #{order_instance.employee.username}\n"
    puts "Delivered: #{order_instance.delivered}\n"
  end

  def display_all(order_instances)
    order_instances.each do |order_instance|
      display_instance(order_instance)
    end
  end

  def ask_for(stuff)
    puts "Enter #{stuff}:"
    gets.chomp
  end
end
