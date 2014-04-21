class Plane

   def initialize
      land
   end


   def flying?
      @flying
   end

   def take_off
      @flying = true
      # airport.take_off(self)
      self
   end

   def land
      @flying = false
      self
   end


end