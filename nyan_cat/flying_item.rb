require 'gosu'

class FlyingItem
  attr_accessor :x, :y, :width, :height

  def initialize(window)
    @sprite = Gosu::Image.new(self.class.image_path)

    @width  = @sprite.width
    @height = @sprite.height

    reset!(window)
  end

  def draw
    @sprite.draw(@x, @y, 1, 1, 1)
  end

  def reset!(window)
    @y = Random.rand(window.height - @height)
    @x = window.width
  end
end
