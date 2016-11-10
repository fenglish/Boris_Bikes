require_relative "bike_class"

class DockingStation
  attr_reader :bike

  def release_bike
    if @bike == nil then raise "No bikes available!" end
    @bike = Bike.new
  end
  def dock_bike(bike)
    @bike = bike
  end

  #def see_docked_bikes
  #  @bike
  #end

end
