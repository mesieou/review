# Represents a repository for managing Meal objects and persisting them to a CSV file.
require 'csv'
require_relative '../models/meal.rb'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 0
    load_csv if File.exist?(@csv_file)
  end

  def create(meal)
    p meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def edit(index, attr_to_edit_index, new_value)
    instance = find(index)
    attr_to_edit_index == 1 ? instance.name = new_value : instance.price = new_value.to_f
  end

  def delete(index)
    @meals.delete_if { |meal| meal.id == index }
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      @meals << Meal.new(id: row[:id].to_i, name: row[:name], price: row[:price].to_f)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end
end
