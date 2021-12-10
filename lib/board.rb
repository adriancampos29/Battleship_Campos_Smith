class Board
  # attr_reader :board_cells
  #
  # def initialize
  # end

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

end
