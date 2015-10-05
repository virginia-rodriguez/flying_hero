require 'gosu'

require_relative 'cat'

module NyanCat
  class Game < Gosu::Window

    def initialize
      super(900, 550, fullscreen: false)
      self.caption = 'Nyan cat!'

      @cat = NyanCat::Cat.new
    end

    def update
      if button_down? Gosu::KbUp
        @cat.move_up!
      end

      if button_down? Gosu::KbDown
        @cat.move_down!
      end
    end

    def draw
      @cat.draw
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end

  end
end