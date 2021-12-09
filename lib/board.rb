class Board
  # hash = Hash.new(".")
  # require "pry"; binding.pry
  # hash["A1"]

  new_hash = Hash.new {|hash,key| hash[key] = "."}
  new_hash["A1"]
  new_hash["A2"]
  new_hash["A3"]
  p new_hash
end
