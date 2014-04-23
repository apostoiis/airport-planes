class Plane
   def initialize(name="")
      @name=name
      land!
   end

   def flying?
      @flying
   end

   # be consistent if land has a bang then take off should have a bang
   def take_off
      @flying = true
      # airport.take_off(self)
      self
   end

   def land!
      @flying = false
      self
   end
end
