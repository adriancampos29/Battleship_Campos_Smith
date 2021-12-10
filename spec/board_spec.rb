require './lib/board'
require './lib/cell'

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
end
