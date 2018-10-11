require 'rspec'
require 'spec_helper'
require_relative '../../lib/core/Tile'
require_relative '../../lib/core/Player'

RSpec.describe Tile do
  it "The tile gets checked by a player" do
    tile = Tile.new
    player = Player.new('X')
    expect(tile.check(player)).to eql(player)
  end

  it "When a tile is checked, you can get the symbol" do
    tile = Tile.new
    player = Player.new('X')
    tile.check(player)
    expect(tile.get_check).to eql('X')
  end
end
