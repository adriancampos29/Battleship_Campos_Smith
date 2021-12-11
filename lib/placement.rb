require './lib/board'
require './lib/ship'
class Placement
  attr_reader :letters, :nums, :valid_placement

  def initialize(valid_placement)
    @letters = []
    @nums = []
    @valid_placement = valid_placement
  end

  def split_keys
    @valid_placement.each do |coordinate|
      @letters << coordinate.split('').first
      @nums << coordinate.split('').last
    end
  end


# letters[0..(ship.length - 1)]
# letters[0..(ship.length - 1)].all?(placement[0][0])
end


# letters = []
# nums = []
# @letter
