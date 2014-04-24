require './lib/plane'
require './lib/weather'

class Airport
   include Weather

   def initialize(capacity = 7)
      @planes=[]
      @capacity = capacity
   end

   def planes
      @planes
   end

   def land!(plane)
      raise "full" if is_full?
      raise "You can't land the plane" if is_stormy?
      plane.land!
      @planes << plane
   end

   def is_full?
      @capacity == plane_count
   end

   def has_planes?
      @planes.any?
   end

   def plane_count
      planes.count
   end

   def take_off(plane)
      if is_stormy?
         return "You cant take off with this weather!"
      else
         @planes.delete(plane)
         plane.take_off
          # "There are now #{plane_count} planes at the airport"
      end
   end
end