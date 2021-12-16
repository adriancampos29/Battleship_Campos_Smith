require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'

class Game
  attr_reader :board, :computer_board, :computer_ships, :computer, :shot, :comp_ship_sunk, :human_ship_sunk, :comp_shot

  def initialize(board, board_2)
    @board = board
    @computer_board = board_2
    @computer = Computer.new(board_2)
    @player = Player.new(board)
    @shot = shot
    @comp_ship_sunk = 0
    @human_ship_sunk = 0
    @comp_shot = comp_shot
  end

  def two_ships
    [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def greeting
    puts "Welcome to Battleship!"
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == "p"
      start_game
    elsif
      input == "q"
      puts "Bummer, have a great day!"
      quit_game
    else
      puts "Invalid option"
    end
  end

  def start_game
    @computer.computer_place_ships
    @player.user_input_ships
    turn
  end

  def turn
    display_boards
    until @comp_ship_sunk == 2 || @human_ship_sunk == 2
      puts "Select a coordinate to fire upon"
      user_shot
      computer_shot
      display_boards
    end
    winner
  end

  def display_boards
    puts  "=============COMPUTER BOARD============="
    puts  "#{@computer_board.render}"
    puts  "==============PLAYER BOARD=============="
    puts  "#{@board.render(true)}"
  end

  def user_shot
    puts "Enter the coordinate for your shot:"
    @shot = gets.chomp.upcase
      if valid_shot?(@shot) == true
        if @computer_board.cells[@shot].render == "X"
          puts "Your shot #{shot} sunk my battleship!! :( :("
            @comp_ship_sunk += 1
        elsif @computer_board.cells[@shot].render == "H"
          puts "Your shot #{shot} hit my battleship!! :("
        elsif @computer_board.cells[@shot].render == "M"
          puts "Your shot #{shot} missed haha!"
        end
      else
        valid_shot?(@shot) == false
          puts "Your input is invalid, please enter a valid coordinate"
    end
  end

  def valid_shot?(shot)
    until @computer_board.valid_coordinate?(shot) && @computer_board.cells[shot].fired_upon? == false
      puts "Your input is invalid, please enter a valid coordinate"
      shot = gets.chomp.upcase
      @shot = shot
    end
    @computer_board.cells[shot].fire_upon
    return true
  end

  def computer_shot
    @comp_shot = @board.cells.keys.sample
    until @board.valid_coordinate?(@comp_shot) && @board.cells[@comp_shot].fired_upon? == false
      @comp_shot = @board.cells.keys.sample
    end
      @board.cells[@comp_shot].fire_upon
      computer_feedback
  end

  def computer_feedback
    if @board.cells[@comp_shot].render(true) == "X"
      puts "The computer shot #{comp_shot} sunk my battleship!! :( :("
        @human_ship_sunk += 1
    elsif @board.cells[@comp_shot].render(true) == "H"
      puts "The computer shot #{comp_shot} hit my battleship!! :("
    elsif @board.cells[@comp_shot].render(true) == "M"
      puts "The computer shot #{comp_shot} missed haha!"
    end
  end

  def winner
    if @comp_ship_sunk == 2
      puts "You won!!"
      end_game
    elsif @human_ship_sunk == 2
      puts "Victory I win!!"
      end_game
    end
  end

  def end_game
    if @comp_ship_sunk == 2 || @human_ship_sunk == 2
      puts "GAME OVER"
    end
    restart
  end

  def restart
    board = Board.new
    board_2 = Board.new
    @computer = Computer.new(board_2)
    @player = Player.new(board)
    initialize(board, board_2)
    greeting
  end
end
