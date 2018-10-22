# Loads 'lib/' to the $LOAD_PATH
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'console/console'
require 'core/game'
require 'core/players/human'

player1 = Human.new('X')
player2 = Human.new('Y')
game = Game.new(player1, player2)
console = Console.new(game)

console.play
