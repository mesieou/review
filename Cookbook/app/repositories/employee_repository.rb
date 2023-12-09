require_relative '../repositories/base_repository.rb'
require_relative '../models/employee.rb'
require 'csv'

class EmployeeRepository < BaseRepository
  def find_by_username(username)
    @instances.find { |instance| instance.username == username.downcase }
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @instances << Employee.new(id: row[0].to_i, username: row[1], password: row[2], role: row[3])
    end
    @next_id = @instances.empty? ? 1 : @instances.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << ["id", "username", "password", "role"]
      @instances.each do |instance|
        csv << [instance.id, instance.username, instance.password, instance.role]
      end
    end
  end
end
