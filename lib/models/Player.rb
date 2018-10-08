class Player
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(board, row, column)
    board.check_tile(row, column, self)
  end
end
