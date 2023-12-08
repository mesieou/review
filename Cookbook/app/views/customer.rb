class CustomerView
  def ask_for_customer_details
    puts 'customer name:'
    customer_name = gets.chomp
    puts 'customer address:'
    customer_address = gets.chomp
    { name: customer_name, address: customer_address }
  end

  def display_customer(customer_instance)
    puts ''
    puts "Customer Name: #{customer_instance.name}"
    puts "Address: #{customer_instance.address}\n"
  end

  def display_customers(customer_instances)
    customer_instances.each do |customer_instance|
      display_customer(customer_instance)
    end
  end

  def confirm_customer_created(customer_instance)
    puts ''
    puts 'Success!. customer created:'
    display_customer(customer_instance)
  end
end
