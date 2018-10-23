require "core/board"
require "core/player"

class Machine < Player
  def initialize(symbol)
    super(symbol)
  end

  def get_move(board)
    (0...board.size).each do |row|
      (0...board.size).each do |column|
        return [row, column] if board.tile(row, column) == Board::UNCHECKED_TILE
      end
    end
  end
end
