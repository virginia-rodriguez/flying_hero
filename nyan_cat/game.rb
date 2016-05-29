require 'gosu'

require_relative 'background'
require_relative 'hero'
require_relative 'scoreboard'
require_relative 'flying_item'
require_relative 'asteroid_big'
require_relative 'asteroid_small'
require_relative 'candy'

class Game < Gosu::Window

  def initialize
    super(900, 550, fullscreen: false)
    self.caption = 'Flying hero!'

    @background = Background.new
    @scoreboard = Scoreboard.new

    @hero  = Hero.new
    @candy = Candy.new(self)
    set_asteroid
  end

  def update
    @background.scroll!

    @candy.move!
    @candy.reset!(self) if @candy.x < 0

    @asteroid.move!
    set_asteroid if @asteroid.x < 0

    if button_down? Gosu::KbUp
      @hero.move_up!
    end

    if button_down? Gosu::KbDown
      @hero.move_down!
    end
  end

  def draw
    @background.draw
    @scoreboard.draw

    @hero.draw
    @asteroid.draw
    @candy.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def set_asteroid
    @asteroid = @asteroid && @asteroid.instance_of?(AsteroidBig) ?
      AsteroidSmall.new(self) : AsteroidBig.new(self)
  end

end
