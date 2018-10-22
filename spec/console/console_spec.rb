require 'rspec'
require 'console/console'

RSpec.describe Console do
  before(:each) do
    player1 = Player.new('x')
    player2 = Player.new('o')
    @game = Game.new(player1, player2)
    @output = StringIO.new
    @console = Console.new(@game, @output)
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

  it "Accepts correct input and parses it" do
    # Arrange
    input = StringIO.new("1,2")
    @console = Console.new(@game, @output, input)

    # Act
    valid_move = @console.request_move

    # Assert
    expect(valid_move).to eql([1,2])
  end

  it "Validates wrong input and prompts for input again" do
    # Arrange
    input = StringIO.new
    @console = Console.new(@game, @output, input)
    allow(input).to receive(:gets).and_return("asdfasdf", "1,1")

    # Act
    valid_move = @console.request_move

    # Assert
    expect(valid_move).to eql([1,1])
  end

  #TODO Test play display.

  #TODO Test play method - The loop. Should we extract that logic? Yes.
end
