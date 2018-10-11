require 'highline'
require_relative 'Console'
require_relative '../../lib/core/Game'
require_relative '../../lib/core/Player'

highline = HighLine.new
console = Console.new(highline)

player1 = Player.new('X')
player2 = Player.new('Y')
game = Game.new(player1, player2)

console.print_board(game.board)
until game.has_ended?
  coordinates = console.request_move
  game.make_move(coordinates[0], coordinates[1])
  game.toggle_player
  console.print_board(game.board)
end

if game.winner != nil
  highline.say "The winner is #{game.winner.symbol}"
end

# TODO stuff below
# require_relative ~ smell. Check load path. Might need to set load path. file names are lowercase.
# break this file down. Tests for this logic.
