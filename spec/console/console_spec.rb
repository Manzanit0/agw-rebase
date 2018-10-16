require 'rspec'
require_relative '../../lib/console/console'

RSpec.describe Console do
  before(:each) do
    player1 = Player.new('x')
    player2 = Player.new('o')
    @game = Game.new(player1, player2)
    @console = Console.new(@game)
  end

  it "Prints an empty board at the start of the game" do
    EMPTY_BOARD = <<~HEREDOC

      _____________
      |   |   |   | 
      _____________
      |   |   |   | 
      _____________
      |   |   |   | 
      _____________
    HEREDOC
    board = @game.board
    expect{@console.print_board(board)}.to output(EMPTY_BOARD).to_stdout
  end
end
