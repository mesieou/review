class Employee
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end
end

juan = Employee.new(id: 1,username: "Juan", password: "secret", role: "manager")
p juan
