require './lib/plane'
require './lib/airport'

# We have planes and airport(s), planes can land and take off and the aiport has a fixed capacity beyond which no more planes can land. On initialization, planes are not flying, each plane has a name. Weather is random, either sunny or stormy, planes can neither land nor take off when weather is stormy


# Nice to have: Planes should be created in a hangar (not flying) and transporter can take them to the airport.

describe Plane do
   let(:plane)  { Plane.new   }
   let(:airport) { Airport.new }

   it 'is not flying when created' do
      expect(plane.flying?).to be_false
   end

   it 'can take off' do
      plane.take_off
      expect(plane.flying?).to be_true
   end

   it 'can land' do
      plane.take_off
      plane.land
      expect(plane.flying?).to be_false
   end

   # it 'can land' do
   #    # airport = double :aiport
   #    plane.land
   #    expect(plane.landed?).to be_true
   #    # expect(airport).to receive(:land_plane)
   # end

   # it "if it is flying it's no longer at the airport" do
   #    airport.land(plane)
   #    plane.take_off(airport)
   #    expect(airport.has_planes?).to be_false
   # end


end

