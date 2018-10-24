class Board
  UNCHECKED_TILE = ' '

  attr_reader :size

  def initialize(size)
    @size = size
    @board = []

    (0...size).each do |i|
      @board[i] = []
      (0...size).each do
        @board[i] << UNCHECKED_TILE
      end
    end
  end

  def tile(row, column)
    @board[row][column]
  end

  def column(column)
    tiles = []
    @board.each do |row|
      tiles << row[column]
    end
    tiles
  end

  def diagonal
    tiles = []
    i = 0
    @board.each do |row|
      tiles << row[i]
      i+=1
    end
    tiles
  end

  def anti_diagonal
    tiles = []
    i = @size - 1
    @board.each do |row|
      tiles << row[i]
      i-=1
    end
    tiles
  end

  def check_tile(row, column, player)
    @board[row][column] = player.symbol
  end

  def is_board_complete?
    @board.each do |row|
      row.each do |tile|
        return false unless tile != UNCHECKED_TILE
      end
    end
    true
  end

  def has_won?(player)
    column_win, row_win, diagonal_win, anti_diagonal_win = true, true, true, true

    (0...@size).each do |row|
      (0...@size).each do |column|
        row_win = false if @board[row][column] != player.symbol
        column_win = false if @board[column][row] != player.symbol
        diagonal_win = false if row == column && @board[row][column] != player.symbol
        anti_diagonal_win = false if @board[row][@size-1-row] != player.symbol
      end

      return true if (
        row_win ||
        column_win ||
        (diagonal_win && (row == @size - 1)) ||
        (anti_diagonal_win && (row == @size - 1))
      )

      column_win, row_win = true, true
    end

    false
  end
end
