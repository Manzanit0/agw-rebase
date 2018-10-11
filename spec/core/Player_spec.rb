require 'rspec'
require 'spec_helper'
require_relative '../../lib/core/Player'
require_relative '../../lib/core/Board'

RSpec.describe Player do
  it "Initializes with a symbol" do
    player = Player.new('X')
    expect(player.symbol).to eql('X')
  end

  it "Checks a specified tile in the board" do
    board = Board.new(3)
    player = Player.new('X')
    player.make_move(board, 0, 0)
    expect(board.tile(0, 0).get_check).to eql('X')
  end
end
