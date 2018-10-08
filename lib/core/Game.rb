require_relative 'Board'

class Game # TODO this has a huge bottle neck with all the looping. Improve algorithm
  attr_accessor :player1
  attr_accessor :player2
  attr_accessor :currentPlayer
  attr_accessor :board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @currentPlayer = player1
    @board = Board.new(3,3) # ATM, hardcoded. Down the road, we inyect it.
  end

  def make_move(row, column)
    @currentPlayer.make_move(@board, row, column)
  end

  def toggle_player
    @currentPlayer = @currentPlayer == @player1 ? @player2 : @player1
  end

  def has_ended?
    @board.is_board_complete? || @board.has_won?(@player1) || @board.has_won?(@player2)
  end

  def winner
    return player1 if @board.has_won?(@player1)
    return player2 if @board.has_won?(@player2)
    nil
  end
end
