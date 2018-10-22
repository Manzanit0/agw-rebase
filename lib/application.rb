# Loads 'lib/' to the $LOAD_PATH
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "console/console"
require "core/game"
require "console/cli_player"
require "core/players/machine"

player1 = CliPlayer.new("X")
player2 = Machine.new("O")
game = Game.new(player1, player2)
console = Console.new(game)

console.play
