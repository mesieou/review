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

  def edit
    list
    index = @view.ask_for_customer_index
    attr_to_edit_index = @view.ask_for_attritube_to_edit
    new_value = @view.ask_for_new_value(attr_to_edit_index)
    @customer_repository.edit(index, attr_to_edit_index, new_value)
    customer_instance = @customer_repository.find(index)
    @view.confirm_customer_updated(customer_instance)
  end
end
