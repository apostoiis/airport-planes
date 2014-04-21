require 'airport'
require 'plane'

describe Airport do
   let(:airport) { Airport.new }
   let(:plane)   { Plane.new   }


   it 'is created without any planes' do
      expect(airport).not_to have_planes
   end

   it 'can park a plane' do
      airport.land(plane)
      expect(airport).to have_planes
   end

   it 'is built with a fixed capacity' do
      expect {100.times {airport.land(plane)}}.to raise_error
   end

   it 'knows how many planes are in the aiport' do
      4.times {airport.land(plane)}
      expect(airport.plane_count).to eq(4)
   end

   it 'a plane can take off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.plane_count).to eq(0)
   end

   it 'if it parks a plane it is no longer flying' do
      plane.take_off
      airport.land(plane)
      expect(plane.flying?).to be_false
   end

   it 'if it takes off a plane it is flying' do
      airport.take_off(plane)
      expect(plane.flying?).to be_true
   end

   # it 'doesnt have the plane if it is taken off' do
   #    airport.take_off(plane)
   #    expect(@planes.include?(plane)).to be_false
   # end

   # it 'a plane is flying if it has taken off' do
   #    airport.land(plane)
   #    airport.take_off(plane)
   #    expect(plane.flying?).to be_true
   # end


end