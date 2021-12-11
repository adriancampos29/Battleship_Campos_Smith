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
    # cell.empty?
    @valid_placement = placement
    # ship.length == placement.length

    # cells.keys.each do |key|
    #   split_key = key.split('')
    #   letters << split_key.first
    #   nums << split_key.last
    # end
  end
end
