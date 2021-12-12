class Board
  def cells
    # making our game board in a method called cells
    board_cells = {}
    # empty hash variable
    ("A".."D").to_a.each do |letter|
    # iterating through each letter in range A - D & making it an array
      (1..4).to_a.each do |number|
    # iterating through each number in range 1 - 4 & making it an array
        key = (letter + number.to_s)
    # making key variable to add string letter and number to a string to make a coordinate (ex "A1")
        board_cells[key] = Cell.new(key)
    # adding keys to hash board_cells set equal to an instance Cell
      end
    end
    board_cells
    # implicit return of newly made hash board_cells
  end

  def valid_coordinate?(coordinate)
    !!cells[coordinate]
  # double negative boolean to return coordinate being passed in as true or false
  end

  def valid_placement?(ship, placement)
    ship.length == placement.length
  # first step compares ship length to coordinates/placement length being passed in
    horizontal_ship = consec_nums(ship, placement) && same_letters(placement)
  # making variable horizontal ship with two methods that define proper placement
    vertical_ship = consec_letters(ship, placement) && same_nums(placement)
    horizontal_ship || vertical_ship
  # it can be valid if it's placement is horizontal or vertical
  end

  def consec_nums(ship, placement)
    numbers = placement.map {|coordinate| coordinate[1].to_i}
  # iterating over coordinates in placement array
  # splits the number from the coordinate into an integer array
    if ship.length == 2
      numbers[-1] - numbers[0] == 1

    elsif ship.length == 3
      numbers[-1] - numbers[0] == 2
    end
  end

  def consec_letters(ship, placement)
  # needs consecutive letters for vertical ships
    letters = placement.map {|coordinate| coordinate[0]}
    # splits the letter from the coordinate into an array
    if ship.length == 2
      letters[-1].ord - letters[0].ord == 1

    elsif ship.length == 3
      letters[-1].ord - letters[0].ord == 2
    end
  end

  def same_nums(placement)
    numbers = placement.map {|coordinate| coordinate[1].to_i}
      # splits the number from the coordinate into an integer array
    numbers.all?(numbers[0])
  end

  def same_letters(placement)
    letters = placement.map {|coordinate| coordinate[0]}
    # splits the letter from the coordinate into an array
    letters.all?(letters[0])
  end
end






# numbers = placement.map {|p| p[1].to_i}
# letters = placement.map {|p| p[0]}
