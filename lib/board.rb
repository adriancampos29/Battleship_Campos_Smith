class Board
  attr_reader :cells

  def initialize
    @cells = {}
    generate_cells
  end

  def generate_cells
    # making our game board in a method called generate cells
    ("A".."D").to_a.each do |letter|
    # iterating through each letter in range A - D & making it an array
      (1..4).to_a.each do |number|
    # iterating through each number in range 1 - 4 & making it an array
        key = (letter + number.to_s)
    # making key variable to add string letter and number to a string to make a coordinate (ex "A1")
        @cells[key] = Cell.new(key)
    # adding keys to hash board_cells set equal to an instance Cell
      end
    end
  end

  def valid_coordinate?(coordinate)
    !!cells[coordinate]
  # double negative boolean to return coordinate being passed in as true or false
  end

  def empty_cell?(coordinates)
    coordinates.all? do |coord|
  # iterates through all the coordinates being passed in
      if valid_coordinate?(coord)
  # checks if the coordinate is valid
        @cells[coord].empty?
  # checks if the coor is empty
      end
    end
  end

  def valid_placement?(ship, placement)
    if !empty_cell?(placement)
  # if its  not an empty cell it's not a valid placement
      return false
    elsif ship.length != placement.length
  # if the ship length doesnt equal placement length it's not a valid placement
      return false
    end
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

  def place(ship, placement)
  # if valid_placement?(ship, placement)
      placement.each do |coord|
  # iterate through each coordinate in placement array
  # return if cells[coord].empty? == false
        @cells[coord].place_ship(ship)
  # pass coordinate in cells hash and place ship method on that coordinate
      end
    end
  end







# numbers = placement.map {|p| p[1].to_i}
# letters = placement.map {|p| p[0]}
