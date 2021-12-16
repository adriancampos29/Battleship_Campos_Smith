class Board
  attr_reader :cells

  def initialize
    @cells = {}
    generate_cells
  end

  def generate_cells
    ("A".."D").to_a.each do |letter|
      (1..4).to_a.each do |number|
        key = (letter + number.to_s)
        @cells[key] = Cell.new(key)
      end
    end
  end

  def valid_coordinate?(coordinate)
    !!cells[coordinate]
  end

  def empty_cell?(coordinates)
    coordinates.all? do |coord|
      if valid_coordinate?(coord)
        @cells[coord].empty?
      end
    end
  end

  def valid_placement?(ship, placement)
    if !empty_cell?(placement)
      return false
    elsif ship.length != placement.length
      return false
    end
    horizontal_ship = consec_nums(ship, placement) && same_letters(placement)
    vertical_ship = consec_letters(ship, placement) && same_nums(placement)
    horizontal_ship || vertical_ship
  end

  def consec_nums(ship, placement)
    numbers = placement.map {|coordinate| coordinate[1].to_i}
    if ship.length == 2
      numbers[-1] - numbers[0] == 1

    elsif ship.length == 3
      numbers[-1] - numbers[0] == 2 && numbers[1] - numbers[0] == 1
    end
  end

  def consec_letters(ship, placement)
    letters = placement.map {|coordinate| coordinate[0]}
    if ship.length == 2
      letters[-1].ord - letters[0].ord == 1

    elsif ship.length == 3
      letters[-1].ord - letters[0].ord == 2 && letters[1].ord - letters[0].ord == 1
    end
  end

  def same_nums(placement)
    numbers = placement.map {|coordinate| coordinate[1].to_i}
    numbers.all?(numbers[0])
  end

  def same_letters(placement)
    letters = placement.map {|coordinate| coordinate[0]}
    letters.all?(letters[0])
  end

  def place(ship, placement)
      placement.each do |coord|
        @cells[coord].place_ship(ship)
    end
  end

    def render(show = false)
      "  1 2 3 4 \n" +
      "A #{@cells.values[0].render(show)} #{@cells.values[1].render(show)} #{@cells.values[2].render(show)} #{@cells.values[3].render(show)} \n" +
      "B #{@cells.values[4].render(show)} #{@cells.values[5].render(show)} #{@cells.values[6].render(show)} #{@cells.values[7].render(show)} \n" +
      "C #{@cells.values[8].render(show)} #{@cells.values[9].render(show)} #{@cells.values[10].render(show)} #{@cells.values[11].render(show)} \n" +
      "D #{@cells.values[12].render(show)} #{@cells.values[13].render(show)} #{@cells.values[14].render(show)} #{@cells.values[15].render(show)} \n"
    end
  end
