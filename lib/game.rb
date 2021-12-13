class Game

  def greeting
    puts "Welcome to Battleship!"
    puts "Enter p to play. Enter q to quit."

      input = gets.chomp
      if input == "p"
        start_game
      else
        input == "q"
        quit_game
      end
    end

    def start_game
      computer_place_ships
      user_place_ships
    end

    def end_game

    end


end
