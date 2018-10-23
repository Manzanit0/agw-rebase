require "rspec"
require "console/console"

RSpec.describe Console do
  before(:each) do
    player1 = Player.new("x")
    player2 = Player.new("o")
    @game = Game.new(player1, player2)
    @output = StringIO.new
    @console = Console.new(@output)
  end

  it "Prints an empty board at the start of the game" do
    # Arrange
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

    # Act
    @console.print_board(board)

    # Assert
    expect(@output.string).to eql(EMPTY_BOARD)
  end

  #TODO Test play display.

  #TODO Test play method - The loop. Should we extract that logic? Yes.
end
