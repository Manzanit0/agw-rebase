require "console/game_factory"

class Console
  attr_accessor :game

  def initialize(output = $stdout, input = $stdin)
    @out = output
    @in = input
  end

  def play
    setup_game
    until @game.has_ended?
      process_turn
    end
    restart
  end

  private

  def setup_game
    factory = GameFactory.new
    print_menu

    options = get_menu_option
    @game = factory.create_game(options)

    print_board(@game.board)
  end

  def process_turn
    @game.make_move
    print_board(@game.board)
  end

  def restart
    if @game.winner != nil
      @out.print "The winner is #{@game.winner.symbol}"
    end
    # TODO prompt for reestart.
  end

  def print_menu
    clear_console
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

  def print_row(board, row)
    @out.print "| "
    (0...board.size).each do |position|
      token = board.tile(row, position)
      @out.print "#{token} | "
    end
  end

  def print_board(board)
    clear_console
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
end
