require './lib/board'

class Computer
  attr_reader :board, :cruiser, :submarine

  def initialize
    @computer_board = Board.new
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def random_coords(ship_length)
    array = @computer_board.cells.keys
    array.shuffle!.pop(ship_length)
  end

  def computer_place_ships
    @computer_ships.each do |ship|
      coords = random_coords(ship.length)
      if @computer_board.valid_placement?(ship, coords) == true
        @computer_board.place(ship, coords)
      end
    end
    puts "I have laid out my ships on the grid."
    # user_place_ships
  end
end
