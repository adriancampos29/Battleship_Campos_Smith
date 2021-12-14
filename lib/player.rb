class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @user_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  end

  def user_input_ships
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @board.render
    deploy_cruiser
    deploy_sub
    puts "I have laid out my ships on the grid."
    # puts "Enter the squares for the Cruiser (3 spaces): "
    # squares = gets.chomp
    # squares.to_s.upcase.split(" ")
  end

  # def user_place_ships
  #   @user_ships.each do |ship|
  #     # user_input_ships
  #     if @board.valid_placement?(ship, user_input_ships) == true
  #       @board.place(ship, user_input_ships)
  #     end
  #   end
  #   puts "I have laid out my ships on the grid."
  # end

  def deploy_cruiser
    coords = false
    until coords == true do
    puts "Enter the squares for the Cruiser (3 spaces): "
    squares = gets.chomp
    squares.to_s.upcase.split(" ")
      if @board.valid_placement?(cruiser, squares) == true
        @board.place(cruiser, squares)
          coords = true
      else
        puts "Your coordinates are invalid, please input different ones."
      end
    end
  end

  def deploy_sub
    coords = false
    until coords == true do
    puts "Enter the squares for the Cruiser (3 spaces): "
    squares = gets.chomp
    squares.to_s.upcase.split(" ")
      if @board.valid_placement?(sub, squares) == true
        @board.place(sub, squares)
        coords = true
      else
        puts "Your coordinates are invalid, please input different ones."
      end
    end
  end
end
