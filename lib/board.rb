class Board
  attr_reader :cells
  attr_accessor :valid_placement

  def initialize
    @valid_placement = valid_placement
  end

  def cells
    board_cells = {}
    ("A".."D").to_a.each do |letter|
      (1..4).to_a.each do |number|
        key = (letter + number.to_s)
        board_cells[key] = Cell.new(key)
      end
    end
    board_cells
  end

  def valid_coordinate?(coordinate)
    !!cells[coordinate]
  end

  def valid_placement?(ship, placement)
    if ship.length != placement.length
      false
    end
    numbers = placement.map {|p| p[1].to_i}
    letters = placement.map {|p| p[0]}
    if numbers.uniq.length && (numbers.min..numbers.max).to_a.length == ship.length
      true
    else
      false
    end
    # above code is for horizontal placement. numbers is horizontal, letters if vertical.
    if letters.uniq.length && (letters.min..letters.max).to_a.length == ship.length
      true
    else
      false
    end
   # above if block is for vertical placement. letters is vertical.

    if numbers.uniq != !numbers.uniq.reverse
      false
    else
      true
    end
    #above if block is for backwards horiztonal placement

    if letters.uniq != !letters.uniq.reverse
      false
    else
      true
    end
    # above if block is for backwards vertical placement
  end
end













    # cell.empty?
    # @valid_placement = placement
    # ship.length == placement.length

    # (horizontal_array).each_cons(horizontal_array) do |p|
    # end

    # cells.keys.each do |key|
    #   split_key = key.split('')
    #   letters << split_key.first
    #   nums << split_key.last
    # end
