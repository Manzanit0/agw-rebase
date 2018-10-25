require "console/game_factory"

class Console
  def initialize(output = $stdout, input = $stdin)
    @out = output
    @in = input
  end

  def print_menu
    @out.puts "\n--- GAME MODES ---\n"
    @out.puts "1. Human vs Human"
    @out.puts "2. Human vs Computer"
    @out.puts "3. Computer vs Human"
    @out.puts "4. Computer vs Computer\n"
    @out.print "Choose a game mode to begin (1-4): "
  end

  def get_menu_option
    option = @in.gets.chomp
    r = /^([1-4])$/
    until option.match r
      @out.print "The only valid options are 1 to 4: "
      option = get_menu_option
    end
    option
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
    print_menu
    option = get_menu_option
    factory = GameFactory.new
    @game = factory.create_game(option)

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
