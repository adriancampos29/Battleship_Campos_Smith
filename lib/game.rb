require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'

class Game
  attr_reader :board, :computer_board, :user_ships, :computer_ships, :computer

  def initialize
    @board = Board.new
    @computer_board = Board.new
    @user_ships = two_ships
    @computer_ships = two_ships
    @computer = Computer.new
    @player = Player.new
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
      quit_game
    else
      puts "Invalid option"
    end
  end

  def start_game
    @computer.computer_place_ships
    # @player.user_place_ships
    @player.user_input_ships
  end

  def quit_game

  end

  # def computer_place_ships
  #   computer.computer_place_ships
  # end
  # def random_coords(ship_length)
  #   array = @computer_board.cells.keys
  #   array.shuffle!.pop(ship_length)
  # end
  #
  # def computer_place_ships
  #   @computer_ships.each do |ship|
  #     coords = random_coords(ship.length)
  #     if @computer_board.valid_placement?(ship, coords) == true
  #       @computer_board.place(ship, coords)
  #     end
  #   end
  #   puts "I have laid out my ships on the grid."
  #   # user_place_ships
  # end


  # def user_input_ships
  #   puts "You now need to lay out your two ships."
  #   puts "The Cruiser is three units long and the Submarine is two units long."
  #   puts @board.render
  #   puts "Enter the squares for the Cruiser (3 spaces): "
  #   squares = gets.chomp
  #   squares.to_s.upcase.split(" ")
  # end

  # def user_place_ships
  #   @player.user_input_ships
    # @user_ships.each do |ship|
    #   if @board.valid_placement?(ship, user_input_ships) == true
    #     @board.place(ship, user_input_ships)
    #   end
    # end
  #   puts "I have laid out my ships on the grid."
  # end

 end
