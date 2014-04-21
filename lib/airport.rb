class Airport

   def initialize(capacity = 99)
      @planes=[]
      @capacity = capacity
   end

   def planes
      @planes
   end

   def land(plane)
      if @capacity > @planes.count
         @planes << plane
         plane.land
      else
         raise "Sorry maximum capacity is reached."
      end
      puts "There are now #{plane_count} planes at the airport"
   end

   def has_planes?
      @planes.any?
   end

   def plane_count
      @planes.count
   end

   def take_off(plane)
      @planes.delete(plane)
      plane.take_off
      puts "There are now #{plane_count} planes at the airport"
   end



end