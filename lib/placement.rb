# require './lib/board'
# require './lib/ship'
class Placement

def consec_nums(placement)
  numbers = placement.map {|p| p[1].to_i}
  # splits the number from the key into an integer array
  if ship.length == 2
    if numbers[-1] - numbers[0] == 1
      true
    else
      false
    end

  elsif ship.length == 3
    if numbers[-1] - numbers[0] == 2
      true
    else
      false
    end
  end
end

def consec_letters(placement)
  # needs consecutive letters for vertical ships
  letters = placement.map {|p| p[0]}
  # splits the letter from the key into an array
  if ship.length == 2
   if letters[-1].ord - letters[0].ord == 1
     true
   else
    false
   end

 elsif ship.length == 3
   if letters[-1].ord - letters[0].ord == 1
     true
   else
     false
   end
 end
end

def same_nums(placement)
  numbers = placement.map {|p| p[1].to_i}
    # splits the number from the key into an integer array
    if numbers.all?(numbers[0])
      true
    else
      false
    end
  end
end

def same_letter(placement)
  letters = placement.map {|p| p[0]}
  # splits the letter from the key into an array
  if letters.all?(letters[0])
    true
  else
    false
  end
end
# cells.keys.each do |key|
#   split_key = key.split('')
#   letters << split_key.first
#   nums << split_key.last
# end
# letters[0..(ship.length - 1)]
# letters[0..(ship.length - 1)].all?(placement[0][0])

# attr_reader :letters, :nums, :valid_placement
#
# def initialize(valid_placement)
#   @letters = []
#   @nums = []
#   @valid_placement = valid_placement
# end
#
# def split_keys
#   @valid_placement.each do |coordinate|
#     @letters << coordinate.split('').first
#     @nums << coordinate.split('').last
#   end
# end
