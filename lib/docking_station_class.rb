require_relative "bike_class"

class DockingStation

  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available!" if empty?
    bike = @bikes.last
    @bikes.pop
    bike
  end

  def dock_bike(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

private

def full?
  @bikes.size == DEFAULT_CAPACITY
end

def empty?
  @bikes.empty?
end

end
