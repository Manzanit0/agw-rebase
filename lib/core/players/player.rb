class Player
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(board)
    coordinates = get_move(board)
    board.check_tile(coordinates[0], coordinates[1], self)
  end

  def get_move(board)
    raise NotImplementedError.
            new("#{self.class.name}# has not implemented the method get_move")
  end
end
