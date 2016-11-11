require 'docking_station'

describe DockingStation do

  describe "#release_bike" do
    it { is_expected.to respond_to :release_bike }

    it "releases a bike" do
      bikes = subject.dock_bike(Bike.new)
      expect(subject.release_bike).to be_an_instance_of(Bike)
    end

    it "releases a bike that works" do
      bikes = subject.dock_bike(Bike.new)
      expect(subject.release_bike.working?).to eq true
    end

    it "should not release a bike when there are no bikes" do
      expect{ subject.release_bike }.to raise_error("No bikes available!")
    end

  end

  describe "#report_bike_condition" do
    it { is_expected.to respond_to :report_bike_condition }

    it { is_expected.to respond_to(:report_bike_condition).with(1).argument}

    it 'should return true if bike is working' do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to eq true
    end

    it 'should report false if bike is not working' do
      expect(subject.report_bike_condition(false)).to eq false
    end

  end

  describe "#dock_bike" do
    it { is_expected.to respond_to :dock_bike }

    it "docks a returned bike" do
      expect(subject.dock_bike(Bike.new)).to be_truthy
    end

    it "shows docked bikes when asked" do
      #require 'pry'; binding.pry
      expect( 3.times { subject.dock_bike(Bike.new) } ).to eq subject.bikes.size
    end

    it "should not allow for more bikes than default capacity to be docked" do
      bikes = DockingStation::DEFAULT_CAPACITY.times{ subject.dock_bike(Bike.new)}
      expect{ subject.dock_bike(Bike.new)}.to raise_error("Docking station is full")
    end

    it "should accept up to default capacity of bikes in each docking station" do
      expect( DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(Bike.new) } ).to be_truthy
    end

    it "docking station should only accept a bike object" do
      returning_bike = Bike.new
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
