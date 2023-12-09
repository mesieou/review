class EmployeeView
  def ask_for(stuff)
    puts "Enter #{stuff}:"
    gets.chomp
  end

  def logged_in(username_instance)
    puts "Welcome #{username_instance.username}"
  end

  def incorrect_credentials
    puts "Incorrect credentials"
  end
end
