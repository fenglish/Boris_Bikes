require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike }

  describe "#release_bike" do
    it { is_expected.to respond_to :release_bike }

    it "should not release a bike when there are no bikes" do
      expect{ subject.release_bike }.to raise_error("No bikes available!")
    end

    it "should not release any bikes when all bikes are broken" do
      station = DockingStation.new(1)
      expect{ subject.release_bike }.to raise_error("No bikes available!")
    end

  end

  describe "#dock_bike" do

    it { is_expected.to respond_to :dock_bike }

    it "docks a returned bike" do
      bike = double(:bike, :working? => true)
      expect(subject.dock_bike(bike)).to be_truthy
    end

    it "shows docked bikes when asked" do
      # require 'pry'; binding.pry
      bike = double(:bike, :working? => true)
      expect( 1.times { subject.dock_bike(bike) } ).to eq subject.bikes.size
    end

    it "should not allow for more bikes than default capacity to be docked" do
      bike = double(:bike, :working? => true)
      station2 = DockingStation.new(0)
      expect{ station2.dock_bike(bike)}.to raise_error("Docking station is full")
    end

    it "should accept up to default capacity of bikes in each docking station" do
      bike = double(:bike, :working? => true)
      expect( DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) } ).to be_truthy
    end

    it "docking station should only accept a bike object" do
      bike = double(:bike, :working? => true)
      returning_bike = bike
      expect(subject.dock_bike(returning_bike)).to eq true
    end


  end

  describe "capacity" do
    it { is_expected.to respond_to :capacity }
    it "should access capacity" do
      expect(subject.capacity).to be_truthy
    end
  end

  describe "initialize" do
    it "should specify a larger capacity when necessary" do
      subject = DockingStation.new(50)
      expect(subject.capacity).to eq 50
    end
    it "should pass default capacity if there is no argument" do
      subject = DockingStation.new()
      expect(subject.capacity).to eq 20
    end
  end
end
