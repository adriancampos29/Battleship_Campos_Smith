require './lib/board'


RSpec.describe Board do

  it 'exists' do
    board = Board.new
    expect(board).to be_a(Board)
  end

  it 'has cells in the board' do
    board = Board.new
    expect(board.cells).to be_a(Hash)
  end
end
