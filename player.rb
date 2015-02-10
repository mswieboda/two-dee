class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "media/fighter.jpg", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def jump_to(x, y)
    @x = x
    @y = y
  end

  def turn(angle)
    @angle += angle
  end

  def turn_left
    turn(-4.5)
  end

  def turn_right
    turn(4.5)
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480

    @vel_x *= 0.925
    @vel_y *= 0.925
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
