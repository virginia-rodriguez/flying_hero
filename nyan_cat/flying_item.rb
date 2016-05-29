require 'gosu'

class FlyingItem
  attr_accessor :x, :y, :width, :height

  def initialize(window)
    @sprite = Gosu::Image.new(self.class.image_path)

    @width  = @sprite.width
    @height = @sprite.height

    @y = Random.rand(window.height - @height)
    @x = window.width - 100
  end

  def draw
    @sprite.draw(@x, @y, 1, 1, 1)
  end
end
