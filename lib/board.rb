class Board
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
    ship.length == placement.length
  end

  # valid_coordinates
  # ship length == placement length
  # horizontal: same letter && consecutive numbers || same numbers && consecutive letters
  # vertical: same numbers && consecutive letters

  def consec_nums(ship, placement)
    numbers = placement.map {|p| p[1].to_i}
  # splits the number from the key into an integer array
    if ship.length == 2
      numbers[-1] - numbers[0] == 1

    elsif ship.length == 3
      numbers[-1] - numbers[0] == 2
    end
  end

  def consec_letters(ship, placement)
  # needs consecutive letters for vertical ships
    letters = placement.map {|p| p[0]}
    # splits the letter from the key into an array
    if ship.length == 2
      letters[-1].ord - letters[0].ord == 1

    elsif ship.length == 3
      letters[-1].ord - letters[0].ord == 2
    end
  end

  def same_nums(placement)
    numbers = placement.map {|p| p[1].to_i}
      # splits the number from the key into an integer array
    numbers.all?(numbers[0])
  end

  def same_letters(placement)
    letters = placement.map {|p| p[0]}
    # splits the letter from the key into an array
    letters.all?(letters[0])
  end
end






# numbers = placement.map {|p| p[1].to_i}
# letters = placement.map {|p| p[0]}
