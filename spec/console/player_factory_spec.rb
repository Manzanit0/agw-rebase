require "rspec"
require "console/player_factory"
require "console/cli_player"
require "core/machine"

RSpec.describe PlayerFactory do
  it "Creates a Human Player" do
    factory = PlayerFactory.new
    player = factory.create_player(PlayerOptions::Human, "X")

    expect(player.instance_of?(CliPlayer)).to eql(true)
    expect(player.symbol).to eql("X")
  end

  it "Creates a Computer Player" do
    factory = PlayerFactory.new
    player = factory.create_player(PlayerOptions::Machine, "X")

    expect(player.instance_of?(Machine)).to eql(true)
    expect(player.symbol).to eql("X")
  end

  it "Raises an error if the option is not valid" do
    factory = PlayerFactory.new
    expect{factory.create_player("Terminator", "X")}.to raise_error(NotImplementedError)
  end
end
