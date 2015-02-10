require 'gosu'
require_relative 'player'

class MyWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Hello World!'

    @background_image = Gosu::Image.new(self, "media/space.jpg", true)

    @player = Player.new(self)
    @player.jump_to(320, 240)
  end

  def update
    @player.turn_left if button_down?(Gosu::KbLeft) || button_down?(Gosu::GpLeft)
    @player.turn_right if button_down?(Gosu::KbRight) || button_down?(Gosu::GpRight)
    @player.accelerate if button_down?(Gosu::KbUp) || button_down?(Gosu::GpButton0)
    @player.move
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = MyWindow.new
window.show
