require 'csv'
require_relative '../models/customer.rb'
require_relative '../repositories/base_repository.rb'

class CustomerRepository < BaseRepository
  def edit(index, attr_to_edit_index, new_value)
    instance = find(index)
    attr_to_edit_index == 1 ? instance.name = new_value : instance.address = new_value
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @instances << Customer.new(id: row[:id].to_i, name: row[:name], address: row[:address])
    end
    @next_id = @instances.empty? ? 1 : @instances.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "name", "address"]
      @instances.each do |instance|
        csv << [instance.id, instance.name, instance.address]
      end
    end
  end
end
