require "rspec"
require "core/player"

RSpec.describe Player do
  it "Raises an error if get_move is used" do
    player = Player.new("X")

    expect{player.get_move(Board.new(3))}.to raise_error(NotImplementedError)
  end
end
