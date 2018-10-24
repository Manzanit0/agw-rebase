require "rspec"
require "console/console"

RSpec.describe Console do
  before(:each) do
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @game = Game.new(@player1, @player2)
    @output = StringIO.new
    @console = Console.new(@output)
  end

  it "Prints an empty board at the start of the game" do
    EMPTY_BOARD = <<~HEREDOC

      _____________
      |   |   |   | 
      _____________
      |   |   |   | 
      _____________
      |   |   |   | 
      _____________
    HEREDOC

    board = @game.board
    @console.print_board(board)

    expect(@output.string).to eql(EMPTY_BOARD)
  end

  it "Prints a row with its marked tiles" do
    EXPECTED_OUTPUT = "| X |   | O | "
    @game.board.check_tile(1, 0, @player1)
    @game.board.check_tile(1, 2, @player2)
    @console.print_row(@game.board, 1)

    expect(@output.string).to eql(EXPECTED_OUTPUT)
  end

  it "Gets the game mode option from User input" do
    input = StringIO.new("1")
    @console = Console.new(@output, input)

    expect(@console.get_menu_option).to eql("1")
  end

  it "When a user inputs an incorrect game option, it gets reprompted" do
    input = StringIO.new("g\n1")
    @console = Console.new(@output, input)

    expect(@console.get_menu_option).to eql("1")
  end

  #TODO Test play method - The loop. Should we extract that logic? Yes.
end
