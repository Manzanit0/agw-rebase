require 'rspec'
require 'core/board'
require 'core/tictactoe_exception'
require 'core/players/human'

RSpec.describe Human do
  it "Initializes with a symbol" do
    player = Human.new('X')
    expect(player.symbol).to eql('X')
  end

  it "Checks a specified tile in the board" do
    board = Board.new(3)
    player = Human.new('X')
    player.assign_move(0,0)
    player.make_move(board)

    expect(board.tile(0, 0)).to eql('X')
  end

  it "Throws an exception if it tries to make a move without having assigned one." do
    board = Board.new(3)
    player = Human.new('X')

    expect{ player.make_move(board) }.to raise_error(TicTacToeException)
  end
end
