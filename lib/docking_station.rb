require_relative "bike.rb"

class DockingStation

  attr_reader :bikes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = {}
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available!" if no_availability?
    bike = @bikes.index(true)
    @bikes.delete(bike)
    bike
  end

  def dock_bike(bike, condition = true)
    raise "Docking station is full" if full?
    @bikes[bike] = bike.working?(condition)
  end

private

def full?
  @bikes.size == DEFAULT_CAPACITY
end

def no_availability?
  !@bikes.has_value?(true)
end

end
