module Weather
   # don't need
   attr_accessor :stormy

   # don't need
   def initialize
      @stormy = false
   end

   def is_stormy?
      # don't need the instance variable
      @stormy = [true,false].sample
      # @stormy = false
      # clean up your comments!!

   end
end
