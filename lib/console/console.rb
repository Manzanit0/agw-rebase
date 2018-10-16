class Console
  def initialize(game)
    @game = game
  end

  def print_board(board)
    print_line_separator
    (0...board.size).each do |row|
      print_row(board, row)
      print_line_separator
    end
  end

  def request_move
    print "\nPlease input your move (row,column): "
    answer = gets #FIXME Add validation
    answer.split(",").map {|s| s.to_i}
  end

  def clear_console
    print "\e[H\e[2J"
  end

  def print_line_separator
    print "\n_____________\n"
  end

  def print_row(board, row)
    print "| "
      (0...board.size).each do |position|
        token = board.tile(row, position)
        print "#{token} | "
      end
  end

  def play
    clear_console
    print_board(@game.board)

    until @game.has_ended?
      coordinates = request_move
      @game.make_move(coordinates[0], coordinates[1])
      @game.toggle_player
      clear_console
      print_board(@game.board)
    end

    if @game.winner != nil
      print "The winner is #{@game.winner.symbol}"
    end
  end
end
