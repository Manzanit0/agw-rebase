require 'core/tictactoe_exception'
require 'core/players/player'

class Human < Player
  attr_accessor :row, :column

  def make_move(board)
    raise TicTacToeException.new("The player '#{@symbol}' does not have an assigned move.'") if @row == nil || @column == nil
    board.check_tile(@row, @column, self)
    clear_move
  end

  def assign_move(row, column)
    @row = row
    @column = column
  end

  def clear_move
    @row = nil
    @column = nil
  end
end
