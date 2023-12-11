require_relative './base_view.rb'
class EmployeeView < BaseView
  def logged_in(username_instance)
    puts "Welcome #{username_instance.username}"
  end

  def incorrect_credentials
    puts "Incorrect credentials"
  end
end
