require 'rspec'
require 'spec_helper'
require_relative '../../lib/core/Game'
require_relative '../../lib/core/Player'

RSpec.describe Game do
  it "Sets a current player when initialized" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    expect(game.currentPlayer).to eql(player1)
  end

  it "Set current player's move when a move is made" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.make_move(1,2)
    expect(game.board.tile(1, 2).is_checked?).to eql(true)
    expect(game.board.tile(1, 2).get_check).to eql(player1.symbol)
  end

  it "Toggle the current player" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.toggle_player
    expect(game.currentPlayer).to eql(player2)
  end

  it "Mark the game as ended if there are no tiles free" do
    player = Player.new('X')
    game = Game.new(nil, nil)
    for i in 0..2 do
      for j in 0..2 do
        game.board.check_tile(i, j, player)
      end
    end

    expect(game.has_ended?).to eql(true)
  end

  it "Mark the game as ended if a player has won via ROW" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    for i in 0..2 do
      game.board.check_tile(0, i, player1)
    end

    expect(game.has_ended?).to eql(true)
  end

  it "Mark the game as ended if a player has won via COLUMN" do
      player1 = Player.new('X')
      player2 = Player.new('O')
      game = Game.new(player1, player2)
      for i in 0..2 do
        game.board.check_tile(i, 2, player1)
      end

    expect(game.has_ended?).to eql(true)
  end

  it "Mark the game as ended if a player has won via DIAGONAL" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.make_move(0,0)
    game.make_move(1,1)
    game.make_move(2,2)
    expect(game.has_ended?).to eql(true)
  end

  it "Mark the game as ended if a player has won via ANTI-DIAGONAL" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.make_move(0,2)
    game.make_move(1,1)
    game.make_move(2,0)
    expect(game.has_ended?).to eql(true)
  end

  it"Returns the winning player, if there is one" do
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    game.make_move(0,2)
    game.make_move(1,1)
    game.make_move(2,0)
    expect(game.winner).to eql(player1)
  end

  it "When calling winner, if there is no winner, it returns nil" do 
    player1 = Player.new('X')
    player2 = Player.new('O')
    game = Game.new(player1, player2)
    expect(game.winner).to eql(nil)
  end
end
