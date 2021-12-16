class Player
  attr_reader :board, :cruiser, :submarine

  def initialize(board)
    @board = board
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def user_input_ships
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    deploy_cruiser
    puts @board.render(true)
    deploy_sub
    puts @board.render(true)
    puts "I have laid out my ships on the grid."
  end

  def deploy_cruiser
    coords = false
    until coords == true do
    puts "Enter the squares for the Cruiser (3 spaces): "
    squares = gets.chomp.upcase.split(" ")
      if @board.valid_placement?(@cruiser, squares) == true
        @board.place(@cruiser, squares)
          coords = true
      else
        puts "Your coordinates are invalid, please input different ones."
      end
    end
  end

  def deploy_sub
    coords = false
    until coords == true do
    puts "Enter the squares for the Submarine (2 spaces): "
    squares = gets.chomp.upcase.split(" ")
      if @board.valid_placement?(@submarine, squares) == true
        @board.place(@submarine, squares)
        coords = true
      else
        puts "Your coordinates are invalid, please input different ones."
      end
    end
  end
end
