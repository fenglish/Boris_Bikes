require_relative "bike"

class DockingStation

  attr_reader :bikes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
