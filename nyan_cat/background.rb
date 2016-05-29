require 'gosu'

class Background

  attr_accessor :x, :width

  def initialize
    @image  = Gosu::Image.new('assets/images/background.jpg', tileable: true)
    @width  = @image.width
    @x      = 0
  end

  def draw
    @image.draw(@x, 0, 0)
    @image.draw(@x - @image.width, 0, 0)
  end

end
