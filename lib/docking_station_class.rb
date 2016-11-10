require_relative "bike_class"

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.empty? then raise "No bikes available!" end
    bike = @bikes.last
    @bikes.pop
    bike
  end
  def dock_bike(bike)
    if @bikes.size == 20 then raise "Docking station is full" end
    @bikes << bike
  end

end

p DockingStation.new.bikes
