require_relative '../views/customer.rb'
require_relative '../models/customer.rb'
class CustomerController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def add
    customer_hash = @view.ask_for_customer_details
    customer_instance = Customer.new(customer_hash)
    @customer_repository.create(customer_instance)
    @view.confirm_customer_created(customer_instance)
  end

  def list
    customer_instances = @customer_repository.all
    @view.display_customers(customer_instances)
  end
end
