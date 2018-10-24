require "rspec"
require "console/cli_player"
require "core/machine"
require "console/game_factory"

RSpec.describe GameFactory do
  it "Creates a Human vs Human game" do
    factory = GameFactory.new
    game = factory.create_game("1")

    expect(game.currentPlayer.instance_of?(CliPlayer)).to eql(true)
    game.toggle_player # TODO: This is a smell - Find out if there is a way of checking private variables
    expect(game.currentPlayer.instance_of?(CliPlayer)).to eql(true)
  end

  it "Creates a Human vs Computer game" do
    factory = GameFactory.new
    game = factory.create_game("2")

    expect(game.currentPlayer.instance_of?(CliPlayer)).to eql(true)
    game.toggle_player
    expect(game.currentPlayer.instance_of?(Machine)).to eql(true)
  end

  it "Creates a Computer vs Human game" do
    factory = GameFactory.new
    game = factory.create_game("3")

    expect(game.currentPlayer.instance_of?(Machine)).to eql(true)
    game.toggle_player
    expect(game.currentPlayer.instance_of?(CliPlayer)).to eql(true)
  end
  it "Creates a Computer vs Computer game" do
    factory = GameFactory.new
    game = factory.create_game("4")

    expect(game.currentPlayer.instance_of?(Machine)).to eql(true)
    game.toggle_player
    expect(game.currentPlayer.instance_of?(Machine)).to eql(true)
  end

  it "Raises an error if the option is not valid" do
    factory = GameFactory.new
    expect{factory.create_game("69")}.to raise_error(NotImplementedError)
  end
end
