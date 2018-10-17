require 'rspec'
require_relative '../../lib/console/console'

RSpec.describe Console do
  before(:each) do
    player1 = Player.new('x')
    player2 = Player.new('o')
    @game = Game.new(player1, player2)
    @console = Console.new(@game)
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
    expect{@console.print_board(board)}.to output(EMPTY_BOARD).to_stdout
  end

  it "Accepts correct input and parses it" do
    $stdin = StringIO.new("1,2")
    valid_move = @console.request_move
    expect(valid_move).to eql([1,2])
  end

  it "Validates wrong input and prompts for input again" do
    allow($stdin).to receive(:gets).and_return("asdfasdf", "1,1")
    valid_move = @console.request_move
    expect(valid_move).to eql([1,1])
  end

  #TODO Test play display.

  #TODO Test play method - The loop. Should we extract that logic? Yes.
end
