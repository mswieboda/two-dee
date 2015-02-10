require 'gosu'

class MyWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Hello World!'
  end

  def update
  end

  def draw
  end
end

window = MyWindow.new
window.show
