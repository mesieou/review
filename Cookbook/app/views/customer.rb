class CustomerView
  # Ask information to the customer
  def ask_for_customer_details
    puts 'customer name:'
    customer_name = gets.chomp
    puts 'customer address:'
    customer_address = gets.chomp
    { name: customer_name, address: customer_address }
  end

  def ask_for_attritube_to_edit
    puts ''
    puts 'Type 1 to edit the name'
    puts 'Type 2 to edit the address'
    gets.chomp.to_i
  end

  def ask_for_new_value(attr_to_edit_index)
    puts ''
    if attr_to_edit_index == 1
      puts 'Type the new name:'
      gets.chomp
    else
      puts 'Type the new address:'
      gets.chomp
    end
  end

  def ask_for_customer_index
    puts ''
    puts 'Type the customer number you would like to change'
    gets.chomp.to_i
  end

  def ask_for_customer_index_for_deletion
    puts ''
    puts 'Type the customer number you would like to delete:'
    gets.chomp.to_i
  end

  # Display messages to customer
  def display_customer(customer_instance)
    puts ''
    puts "#{customer_instance.id} - Name: #{customer_instance.name}"
    puts "Address: #{customer_instance.address}\n"
  end

  def display_customers(customer_instances)
    customer_instances.each do |customer_instance|
      display_customer(customer_instance)
    end
  end

  # Confirm information to the customer
  def confirm_customer_created(customer_instance)
    puts ''
    puts 'Success!. customer created:'
    display_customer(customer_instance)
  end

  def confirm_customer_updated(customer_instance)
    puts ''
    puts 'Success!. customer updated:'
    display_customer(customer_instance)
  end

  def confirm_customer_deleted
    puts ''
    puts 'Success!. Deleted!'
  end
end
