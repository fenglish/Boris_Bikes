require 'docking_station_class'

describe DockingStation do
it { is_expected.to respond_to :release_bike }


it "releases a bike" do
  @bike = subject.dock_bike(Bike.new)
  expect(subject.release_bike).to be_an_instance_of(Bike)
end

it "releases a bike that works" do
  @bike = subject.dock_bike(Bike.new)
  expect(subject.release_bike.working?).to eq true
end

it { is_expected.to respond_to :dock_bike }
it "docks a returned bike" do
  @bike = subject.dock_bike(Bike.new)
  expect(subject.dock_bike(@bike)).to be_truthy
end

#it { is_expected.to respond_to :see_docked_bikes }
it "shows docked bikes when asked" do
  expect(subject.bike).to eq @bike
end

it "should not release a bike when there are no bikes" do
  expect{ subject.release_bike }.to raise_error("No bikes available!")
end

end
