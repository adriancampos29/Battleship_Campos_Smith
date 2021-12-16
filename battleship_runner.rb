require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/computer'
require './lib/player'

board = Board.new
board_2 = Board.new
game = Game.new(board, board_2)


game.greeting
