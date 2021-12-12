require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  it 'exists' do
    board = Board.new
    expect(board).to be_a(Board)
  end

  it 'has cells in the board' do
    board = Board.new
    expect(board.cells).to be_a(Hash)
  end

  it 'knows which coordinates are valid' do
    board = Board.new
    board.cells
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it 'can determine ship length is the same as placement input length' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'can determine horizontal placement is consecutive/sequential' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.consec_nums(cruiser, ["B2", "B3", "B4"])).to eq(true)
    expect(board.consec_nums(cruiser, ["B1", "B3", "B4"])).to eq(false)
    expect(board.consec_nums(submarine, ["C1", "C4"])).to eq(false)
    expect(board.consec_nums(cruiser, ["A1", "A2", "A4"])).to eq(false)

    # expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    # expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
  end

  it 'can determine vertical placement numbers is consecutive/sequential' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.consec_letters(cruiser, ["A2", "B2", "C2"])).to eq(true)
    expect(board.consec_letters(cruiser, ["A2", "B2", "D2"])).to eq(false)
    expect(board.consec_letters(submarine, ["C2", "D2"])).to eq(true)
    expect(board.consec_letters(submarine, ["A2", "D2"])).to eq(false)
  end

  it 'can determine if ship coordinates have the same number' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.same_nums(["A2", "B2", "C3"])).to eq(false)
    expect(board.same_nums(["A3", "B1"])).to eq(false)
    expect(board.same_nums(["B1", "C1"])).to eq(true)
    expect(board.same_nums(["B1", "C1", "D1"])).to eq(true)
  end

  it 'can have the same letters in different coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.same_letters(["A1", "A2"])).to eq(true)
    expect(board.same_letters(["B1", "B2", "B3"])).to eq(true)
    expect(board.same_letters(["B1", "C2", "D3"])).to eq(false)
    expect(board.same_letters(["C1", "A3"])).to eq(false)
  end
end


  #
  # end

  #
  # it 'cannot be placed backwards' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)
  #
  #   expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  #   expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  # end
  #
  # it 'cannot be diagonal' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)
  #
  #   expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
  #   # expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  # end

  # it 'can have valid placement if ships fit all other criteria' do
  #   board = Board.new
  #   cruiser = Ship.new("Cruiser", 3)
  #   submarine = Ship.new("Submarine", 2)
  #
  #   expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
  # end
