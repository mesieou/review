class BaseView
  # Ask information to customers
  def ask_for(stuff)
    puts "Enter #{stuff}:"
    gets.chomp
  end

  def ask_for_index(stuff1, stuff2)
    puts ''
    puts "Type the #{stuff1} number you would like to #{stuff2}:"
    gets.chomp.to_i
  end

  # Confirmations to customer
  def confirm_created(stuff, instance)
    puts ''
    puts "Success!. #{stuff} created:"
    display_meal(instance)
  end

  def confirm_updated(stuff, instance)
    puts ''
    puts "Success!. #{stuff} updated:"
    display_meal(instance)
  end

  def confirm_deleted
    puts ''
    puts 'Success!. Deleted!'
  end
end
