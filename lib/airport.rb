require './lib/plane'
require "./lib/weather"

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
      # this is horible!!
      # but more to the point it doesn't work
      # you can still land the plane even if it is stormy?
      if is_stormy?
         puts "You cant land the plane, sorry."
      else
         @planes << plane
         plane.land!
         return "There are now #{plane_count} planes at the airport"  #
      end
      # remember to ask Enrique
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
