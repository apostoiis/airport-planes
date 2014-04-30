require_relative 'weather'

class Airport

  include Weather

  attr_reader :name, :capacity, :planes

  def initialize(name, capacity=5)
    @name     = name
    @capacity = capacity
    @planes   = []
  end

  def planes_count
    planes.count
  end

  def park(plane)
    raise "You can't park the plane due to weather conditions" if weather_stormy?
    raise "You can't park I'm full!" if full?
    plane.land!
    planes << plane
  end

  def full?
    capacity == planes_count
  end

  def release(plane)
    raise "You can't take off the plane due to weather conditions" if weather_stormy?
    plane.take_off!
    planes.delete(plane)
  end
end