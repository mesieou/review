require_relative './base_view.rb'
class EmployeeView < BaseView
  def logged_in(username_instance)
    puts "Welcome #{username_instance.username}"
  end

  def incorrect_credentials
    puts "Incorrect credentials"
  end

  # Display messages to customer
  def display_employee(employee_instance)
    puts ''
    puts "#{employee_instance.id} - Name: #{employee_instance.username}"
    puts "Role: #{employee_instance.role}\n"
  end

  def display_all(employee_instances)
    employee_instances.each do |employee_instance|
      display_employee(employee_instance)
    end
  end
end
