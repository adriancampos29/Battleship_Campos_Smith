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

  it 'knows if a cell is open' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.empty_cell?(["A2", "A3"])).to eq(false)
    expect(board.empty_cell?(["A1"])).to eq(false)
    expect(board.empty_cell?(["D1", "D2"])).to eq(true)
  end

  it 'can determine ship length is the same as input placement length' do
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
    expect(board.consec_nums(submarine, ["A1", "C1"])).to eq(false)
    expect(board.consec_nums(cruiser, ["A1", "A2", "A4"])).to eq(false)
  end

  it 'cannot be backwards on the horizontal axis' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  it 'cannot be diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
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

  it 'can say a ship is valid if it has valid coordinates' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'can place a ship on the board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it 'can make sure ships do not overlap' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end

  it 'can render the board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
    expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end





end
