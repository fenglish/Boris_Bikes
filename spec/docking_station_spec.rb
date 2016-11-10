require 'docking_station_class'

describe DockingStation do
it { is_expected.to respond_to :release_bike }


it "releases a bike" do
  bikes = subject.dock_bike(Bike.new)
  expect(subject.release_bike).to be_an_instance_of(Bike)
end

it "releases a bike that works" do
  bikes = subject.dock_bike(Bike.new)
  expect(subject.release_bike.working?).to eq true
end

it { is_expected.to respond_to :dock_bike }
it "docks a returned bike" do
  expect(subject.dock_bike(Bike.new)).to be_truthy
end

it "shows docked bikes when asked" do
  #require 'pry'; binding.pry
  expect( 3.times { subject.dock_bike(Bike.new) } ).to eq subject.bikes.size
end

it "should not release a bike when there are no bikes" do
  expect{ subject.release_bike }.to raise_error("No bikes available!")
end

it "should not allow for more than 20 bike to be docked" do
  bikes = 20.times{ subject.dock_bike(Bike.new)}
  expect{ subject.dock_bike(Bike.new)}.to raise_error("Docking station is full")
end

it "should accept up to 20 bikes in each docking station" do
  expect( 20.times { subject.dock_bike(Bike.new) } ).to be_truthy
end

end
