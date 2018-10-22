require "rspec"
require "core/game"
require "core/players/machine"

RSpec.describe Game do
  before(:each) do
    @player1 = Machine.new("X")
    @player2 = Machine.new("O")
    @game = Game.new(@player1, @player2)
  end

  it "Sets a current player when initialized" do
    expect(@game.currentPlayer).to eql(@player1)
  end

  it "Toggle the current player" do
    @game.toggle_player

    expect(@game.currentPlayer).to eql(@player2)
  end

  it "Mark the @game as ended if there are no tiles free" do
    for i in 0..2
      for j in 0..2
        @game.board.check_tile(i, j, @player1)
      end
    end

    expect(@game.has_ended?).to eql(true)
  end

  it "Mark the @game as ended if a player has won via ROW" do
    for i in 0..2
      @game.board.check_tile(0, i, @player1)
    end

    expect(@game.has_ended?).to eql(true)
  end

  it "Mark the @game as ended if a player has won via COLUMN" do
    for i in 0..2
      @game.board.check_tile(i, 2, @player1)
    end

    expect(@game.has_ended?).to eql(true)
  end

  it "Mark the @game as ended if a player has won via DIAGONAL" do
    @game.board.check_tile(0, 0, @player1)
    @game.board.check_tile(1, 1, @player1)
    @game.board.check_tile(2, 2, @player1)

    expect(@game.has_ended?).to eql(true)
  end

  it "Mark the @game as ended if a player has won via ANTI-DIAGONAL" do
    @game.board.check_tile(0, 2, @player1)
    @game.board.check_tile(1, 1, @player1)
    @game.board.check_tile(2, 0, @player1)

    expect(@game.has_ended?).to eql(true)
  end

  it "Returns the winning player, if there is one" do
    @game.board.check_tile(0, 2, @player1)
    @game.board.check_tile(1, 1, @player1)
    @game.board.check_tile(2, 0, @player1)

    expect(@game.winner).to eql(@player1)
  end

  it "When calling winner, if there is no winner, it returns nil" do
    expect(@game.winner).to eql(nil)
  end
end
