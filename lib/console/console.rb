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

  def request_move
    @out.print "\nPlease input your move (row,column): "
    answer = @in.gets.chomp
    r = /^([0-9]),([0-9])$/ #FIXME validate also size.

    until answer.match r
      @out.print "Please input the move with the following format (row,column): "
      answer = @in.gets.chomp
    end

    answer.split(",").map {|s| s.to_i}
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
      coordinates = request_move
      @game.make_move(coordinates[0], coordinates[1])
      @game.toggle_player
      clear_console
      print_board(@game.board)
    end

    if @game.winner != nil
      @out.print "The winner is #{@game.winner.symbol}"
    end
  end
end
