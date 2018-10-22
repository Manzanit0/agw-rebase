class Player
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(board)
    raise NotImplementedError.
	    new("#{self.class.name}#make_move is an abstract method.")
  end
end
