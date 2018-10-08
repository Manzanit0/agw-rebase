require 'rspec'
require 'highline'
require_relative '../lib/Console'

RSpec.describe Console do
  before do
      allow($stdout).to receive(:write)
  end

  # FIXME this test broke with the last change.
  it "Displays the board on init" do
    cli = HighLine.new
    expect { Console.new(cli) }.to output(Console::BOARD).to_stdout
  end

  it "Returns a valid array with coordinates when requesting a move" do
    # Mock user input (asume the input is correct)
    cli = HighLine.new
    allow(cli).to receive(:ask).and_return('1,2')

    con = Console.new(cli)
    expect(con.request_move).to eql([1,2])
  end
end
