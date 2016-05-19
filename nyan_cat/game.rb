require 'gosu'

require_relative 'background'
require_relative 'cat'
require_relative 'scoreboard'
require_relative 'flying_item'
require_relative 'asteroid_big'
require_relative 'asteroid_small'
require_relative 'candy'


class Game < Gosu::Window

  def initialize
    super(900, 550, fullscreen: false)
    self.caption = 'Nyan cat!'

    @background = Background.new
    @scoreboard = Scoreboard.new

    @cat   = Cat.new
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
      @cat.move_up!
    end

    if button_down? Gosu::KbDown
      @cat.move_down!
    end

    if @cat.bumped_into?(@asteroid)
      @scoreboard.update_score!(@asteroid.points)
      @asteroid.reset!(self)
    end

    if @cat.bumped_into?(@candy)
      @scoreboard.update_score!(@candy.points)
      @candy.reset!(self)
    end
  end

  def draw
    @background.draw
    @scoreboard.draw

    @cat.draw
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
