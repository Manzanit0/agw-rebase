class Console
  def initialize(game, output = $stdout, input = $stdin)
    @game = game
    @out = output
    @in = input
  end

  def print_board(board)
    print_line_separator
    (0...board.size).each do |row|
      print_row(board, row)
      print_line_separator
    end
  end

  def clear_console
    @out.print "\e[H\e[2J"
  end

  def print_line_separator
    @out.print "\n_____________\n"
  end

  def print_row(board, row)
    @out.print "| "
    (0...board.size).each do |position|
      token = board.tile(row, position)
      @out.print "#{token} | "
    end
  end

  def play
    clear_console
    print_board(@game.board)

    until @game.has_ended?
      @game.make_move
      clear_console
      print_board(@game.board)
    end

    if @game.winner != nil
      @out.print "The winner is #{@game.winner.symbol}"
    end
  end
end
