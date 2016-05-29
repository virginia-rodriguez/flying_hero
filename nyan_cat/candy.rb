require_relative 'flying_item'

class Candy < FlyingItem
  def move!
    @x -= 10
  end

  def self.image_path
    'assets/images/candy.png'
  end
end
