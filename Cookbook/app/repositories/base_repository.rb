class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @next_id = 0
    @instances = []
    load_csv if File.exist?(@csv_file)
  end

  def create(instance)
    instance.id = @next_id
    @next_id += 1
    @instances << instance
    save_csv
  end

  def all
    @instances
  end

  def find(id)
    @instances.find { |instance| instance.id == id }
  end

  def delete(index)
    @instances.delete_if { |instance| instance.id == index }
    save_csv
  end
end
