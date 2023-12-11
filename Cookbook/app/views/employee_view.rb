require_relative './base_view.rb'
class EmployeeView < BaseView
  def logged_in(username_instance)
    puts "Welcome #{username_instance.username}"
  end

  def incorrect_credentials
    puts "Incorrect credentials"
  end

  # Display messages to customer
  def display_instance(employee_instance, index)
    puts ''
    puts "#{index + 1} - Name: #{employee_instance.username}"
    puts "Role: #{employee_instance.role}\n"
  end

  def display_all(employee_instances)
    employee_instances.each_with_index do |employee_instance, index|
      display_instance(employee_instance, index)
    end
  end
end
