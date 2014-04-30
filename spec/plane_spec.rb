require 'plane'

describe Plane do
  let(:plane)  { Plane.new("Boieng 747") }

  context "on initialization" do
    it 'has a name' do
      expect(plane.name).to eq "Boieng 747"
    end

    it 'is flying' do
      expect(plane).to be_flying
    end
  end

  context "landing and taking off" do
    it 'should be able to land' do
      expect(plane).to be_flying
      plane.land!
      expect(plane).not_to be_flying
    end

    it 'should be able to take off' do
      plane.land!
      expect(plane).not_to be_flying
      plane.take_off!
      expect(plane).to be_flying
    end

    it "shouldn't be able to take off if it's flying" do
      expect { plane.take_off! }.to raise_error "The plane is already flying! you stupid fuck"
    end

    it "shouldn't be able to land if it's not flying" do
      plane.land!
      expect { plane.land! }.to raise_error "The plane is already landed! you stupid fuck"
    end
  end
end