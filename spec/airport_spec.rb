require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new("Luton", 5) }
  let(:plane)   { Plane.new("name")       }

  before(:each) do
    airport.stub(:weather_stormy?).and_return false
  end

  context "on initializion" do
    it 'has a default capacity' do
      expect(airport.capacity).to eq 5
    end

    it 'has a name' do
      expect(airport.name).to eq "Luton"
    end

    it 'has no planes' do
      expect(airport.planes_count).to eq 0
    end
  end

  context "landing and taking off planes" do
    it 'can park a plane' do
      # plane = double :plane
      # expect(plane).to receive(:land!)
      airport.park(plane)
      expect(airport.planes_count).to eq 1
      expect(plane).not_to be_flying
    end

    it 'can release a plane' do
      airport.park(plane)
      airport.release(plane)
      expect(airport.planes_count).to eq 0
      expect(plane).to be_flying
    end

    it "knows when it's full" do
      airport.capacity.times {airport.park(Plane.new("trdtr"))}
      expect(airport).to be_full
    end

    it "can't park more planes if max capacity reached" do
      airport.capacity.times {airport.park(Plane.new("trdtr"))}
      expect{airport.park(Plane.new("yo"))}.to raise_error "You can't park I'm full!"
    end
  end

  context "weather restrictions" do
    before(:each) do
      airport.stub(:weather_stormy?).and_return true
    end

    it 'should know how the weather is like' do
      expect(airport.weather_stormy?).to be true
    end

    it "can't park planes with weather stormy" do
      expect{airport.park(plane)}.to raise_error "You can't park the plane due to weather conditions"
    end

    it "can't take off planes with weather stormy" do
      expect{airport.release(plane)}.to raise_error "You can't take off the plane due to weather conditions"
    end
  end
end