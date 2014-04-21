module Weather
   attr_accessor :stormy

   def initialize
      @stormy = false
   end

   def is_stormy?
      @stormy = [true,false].sample
      # @stormy = false
   end
end