require "bike.rb"
require "docking_station.rb"

describe Bike do

  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to(:working?).with(1).argument}

  it 'should return true if bike is working' do
      station = DockingStation.new
      expect(station.dock_bike(subject)).to eq true
  end

  it 'should report false if bike is not working' do
    station = DockingStation.new
    expect(station.dock_bike(subject, false)).to eq false
  end

end
