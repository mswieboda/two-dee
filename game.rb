require 'pry'

require 'gosu'
require_relative 'player'

class TwoDee < Gosu::Window
  def initialize
    super(Gosu::available_width, Gosu::available_height, false)
    self.caption = 'Hello World!'
    @background_image = Gosu::Image.new(self, "media/space.jpg", true)

    @player = Player.new(self)
    @player.jump_to(width / 2, height - height / 10)
  end

  def update
    @player.left if button_down?(Gosu::KbLeft)
    @player.right if button_down?(Gosu::KbRight)
    @player.accelerate if button_down?(Gosu::KbUp)
    @player.reverse if button_down?(Gosu::KbDown)
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0, 5, 5)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = TwoDee.new
window.show
