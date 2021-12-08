class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @render = "."
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    ship.hit
    @fired_upon = true
  end

  def render
    if @fire_upon
      return "M"
    end
  end
end

# @render
#   if self.empty? == true
#   @render = "M"
# end
