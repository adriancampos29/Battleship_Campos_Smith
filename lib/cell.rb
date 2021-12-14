class Cell
  attr_reader :coordinate, :ship, :empty
  attr_accessor :place_ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    # @render = "."
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
    if !empty? && ship.sunk?
      "X"
    elsif ship && @fired_upon
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

#return "." unless fired upon
#if @ship
#if sunk put X, else put H
#
# @render

# return "." unless @fire_upon
# if @ship
#   ship.sunk? ? ( return "X" ) : (return "H")
# end
# "M"
# end
