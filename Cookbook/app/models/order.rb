class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id

  def initialize(meal, customer, employee)
    @id = 0
    @meal = meal
    @customer = customer
    @employee = employee
    @delivered = false
  end

  def delivered?
    @delivered
  end

  def delivered!
    @delivered = true
  end
end
