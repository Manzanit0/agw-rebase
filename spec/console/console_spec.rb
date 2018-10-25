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

  it "Prints the board with correct formatting" do
    EMPTY_BOARD = <<~HEREDOC
      \e[H\e[2J
      _____________
      |   |   |   | 
      _____________
      |   |   |   | 
      _____________
      |   |   |   | 
      _____________
    HEREDOC

    board = @game.board
    @console.send(:print_board, board)

    expect(@output.string).to eql(EMPTY_BOARD)
  end

  it "Prints a row with its marked tiles" do
    EXPECTED_OUTPUT = "| X |   | O | "
    @game.board.check_tile(1, 0, @player1)
    @game.board.check_tile(1, 2, @player2)
    @console.send(:print_row, @game.board, 1)

    expect(@output.string).to eql(EXPECTED_OUTPUT)
  end

  it "Gets the game mode option from user input" do
    input = StringIO.new("1")
    @console = Console.new(@output, input)

    expect(@console.send(:get_menu_option)).to eql("1")
  end

  it "When a user inputs an incorrect game option, it gets reprompted" do
    input = StringIO.new("g\n1")
    @console = Console.new(@output, input)

    expect(@console.send(:get_menu_option)).to eql("1")
  end

  it "Initializes the game with user input" do
    input = StringIO.new("1")
    @console = Console.new(@output, input)
    @console.send(:init_game)

    expect(@console.game).not_to eql(nil)
  end

  it "Makes moves until one player has won or it's a draw" do
    output = StringIO.new
    input = StringIO.new(GameOptions::MACHINE_VS_MACHINE)
    @console = Console.new(output, input)

    @console.play

    expect(@console.game.has_ended?).to eql(true)
  end
end
