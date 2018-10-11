require_relative 'console'
require_relative '../../lib/core/Game'
require_relative '../../lib/core/Player'

# Initialization
player1 = Player.new('X')
player2 = Player.new('Y')
game = Game.new(player1, player2)
console = Console.new(game)

# Start playing the game!!
console.play
