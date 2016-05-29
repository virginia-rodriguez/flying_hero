require_relative 'flying_item'

class Asteroid < FlyingItem

  def initialize(window)
    super
    @scale_x = 1
    @scale_y = 1

    @y = Random.rand(window.height - @height)
    @x = window.width - 100
  end

  def draw
    @sprite.draw(@x, @y, 1, @scale_x, @scale_y)
  end

  def self.image_path
    'assets/images/asteroid.png'
  end
end
