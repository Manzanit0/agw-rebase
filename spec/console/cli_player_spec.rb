require "rspec"
require "console/cli_player"

RSpec.describe CliPlayer do
  it "Accepts correct input and parses it" do
    input = StringIO.new("1,2")
    output = StringIO.new
    player = CliPlayer.new("X", output, input)

    valid_move = player.get_move(Board.new(3))

    expect(valid_move).to eql([1, 2])
  end

  it "Prompts for input again if the format is incorrect" do
    input = StringIO.new("1,2")
    output = StringIO.new
    player = CliPlayer.new("X", output, input)
    allow(input).to receive(:gets).and_return("asdfasdf", "1,1")

    valid_move = player.get_move(Board.new(3))

    expect(valid_move).to eql([1, 1])
  end

  it "Prompts for input again if the tile is already taken" do
    output = StringIO.new
    input = StringIO.new("1,1\n0,1")
    player = CliPlayer.new("X", output, input)
    opponent = Machine.new("O")
    board = Board.new(3)
    board.check_tile(1, 1, opponent)

    move = player.get_move(board)

    expect(move).to eql([0,1])
  end
end
