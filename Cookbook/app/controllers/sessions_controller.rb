require_relative '../repositories/employee_repository.rb'
require_relative '../views/employee_view.rb'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @employee_view = EmployeeView.new
  end

  def login
    username = @employee_view.ask_for(:username)
    password = @employee_view.ask_for(:password)
    username_instance = @employee_repository.find_by_username(username)
    if username_instance && username_instance.password == password
      @employee_view.logged_in(username_instance)
      username_instance
    else
      @employee_view.incorrect_credentials
      login
    end
  end
end
