class Plane
  attr_reader :name

  def initialize(name)
    @name = name
    take_off!
  end
  def flying?
    @flying
  end

  def land!
    raise "The plane is already landed! you stupid fuck" unless flying?
    @flying = false
    self
  end

  def take_off!
    raise "The plane is already flying! you stupid fuck" if flying?
    @flying = true
    self
  end
end