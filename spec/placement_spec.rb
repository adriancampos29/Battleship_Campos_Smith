require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/placement'

RSpec.describe Placement do

it 'can separate the coordinate keys into two arrays' do
  board = Board.new
  placement = Placement.new
  require "pry"; binding.pry
  expect(placement.letters).to eq([])
  expect(placement.nums).to eq([])
end

xit 'can fill the letters and nums arrays' do
  board = Board.new
  # cruiser = Ship.new("Cruiser", 3)
  # submarine = Ship.new("Submarine", 2)
  placement = Placement.new
  cell = Cell.new(placement)

  placement.split_keys
  expect(placement.letters).to eq(["A", "A", "A", "A", "B", "B", "B", "B", "C", "C", "C", "C", "D", "D", "D", "D"])
  expect(placement.nums).to eq(["1", "2", "3", "4", "1", "2", "3", "4", "1", "2", "3", "4", "1", "2", "3", "4"])
end


end

#horizontal, vertical, consecutive, empty/can't stack ships
