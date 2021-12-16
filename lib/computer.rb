require './lib/board'
require './lib/game'

class Computer

  def initialize(board)
    @computer_board = board
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def computer_place_ships
    deploy_cruiser
    deploy_sub
  end

  def deploy_cruiser
    coords = @computer_board.cells.keys
    c_cruiser = []
    until @computer_board.valid_placement?(@cruiser, c_cruiser) == true
      c_cruiser = coords.sample(3)
    end
    @computer_board.place(@cruiser, c_cruiser)
  end

  def deploy_sub
    coords = @computer_board.cells.keys
    c_sub = []
    until @computer_board.valid_placement?(@submarine, c_sub)
      c_sub = coords.sample(2)
    end
    @computer_board.place(@submarine, c_sub)
  end
end
