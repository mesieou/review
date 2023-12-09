class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @orders << Order.new(id: row[0].to_i, meal: row[1], customer: row[2], employee: row[3], delivered: (row[4] == true))
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "username", "password", "role"]
      @orders.each do |order|
        csv << [order.id, order.username, order.password, order.role]
      end
    end
  end

end
