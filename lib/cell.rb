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
    ship.hit if empty? != true
    @fired_upon = true
  end

  def render(show = false)
    if ship && @fired_upon
      "H"
    elsif @fired_upon
      "M"
    elsif ship && show
      "S"
    else
      "."
    end
  end
end

# @render
#   if self.empty? == true
#   @render = "M"
# end
