require 'csv'
require_relative '../models/customer.rb'
class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 0
    load_csv if File.exist?(@csv_file)
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def all
    @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id  }
  end

  def edit(index, attr_to_edit_index, new_value)
    instance = find(index)
    attr_to_edit_index == 1 ? instance.name = new_value : instance.address = new_value
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @customers << Customer.new(id: row[:id].to_i, name: row[:name], address: row[:address])
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
