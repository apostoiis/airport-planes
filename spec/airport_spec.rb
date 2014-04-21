require 'airport'
require 'plane'
require 'weather'

describe Airport do
   let(:airport) { Airport.new }
   let(:plane)   { Plane.new   }

   it 'is created without any planes' do
      expect(airport).not_to have_planes
   end

   it 'can park a plane' do
      airport.stub(:is_stormy?).and_return(false)
      airport.land!(plane)
      expect(airport).to have_planes
   end

   it 'is built with a fixed capacity' do
      airport.stub(:is_stormy?).and_return(false)
      expect {8.times {airport.land!(plane)}}.to raise_error
   end

   it 'knows how many planes are in the aiport' do
      airport.stub(:is_stormy?).and_return(false)
      4.times {airport.land!(plane)}
      expect(airport.plane_count).to eq(4)
   end

   it 'a plane can take off' do
      airport.stub(:is_stormy?).and_return(false)
      airport.land!(plane)
      airport.take_off(plane)
      expect(airport.plane_count).to eq(0)
   end

   it 'if it parks a plane it is no longer flying' do
      airport.stub(:is_stormy?).and_return(false)
      plane.take_off
      airport.land!(plane)
      expect(plane.flying?).to be_false
   end

   it 'if it takes off a plane it is flying' do
      airport.stub(:is_stormy?).and_return(false)
      airport.take_off(plane)
      expect(plane.flying?).to be_true
   end

   it 'if the weather is stormy, a plane cant take off' do
      airport.stub(:is_stormy?).and_return(false)
      airport.land!(plane)
      airport.stub(:is_stormy?).and_return(true)
      airport.take_off(plane)
      expect(airport.plane_count).to eq(1)
      # expect(airport.take_off(plane)).to return "You cant take off the plane with this weather"
   end

   it 'if the weather is stormy, a plane cant land!' do
      airport.stub(:is_stormy?).and_return(true)
      airport.take_off(plane)
      airport.stub(:is_stormy?).and_return(true)
      airport.land!(plane)
      expect(airport.plane_count).to eq 0
   end

   it '6 planes must land! and then take off allowing for weather' do
     (1..6).each_with_index {|num,index| Plane.new(index)}
   end
end