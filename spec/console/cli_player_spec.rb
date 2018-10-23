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

  it "Validates wrong input and prompts for input again" do
    input = StringIO.new("1,2")
    output = StringIO.new
    player = CliPlayer.new("X", output, input)
    allow(input).to receive(:gets).and_return("asdfasdf", "1,1")

    valid_move = player.get_move(Board.new(3))

    expect(valid_move).to eql([1, 1])
  end
end
