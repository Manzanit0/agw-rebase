require "rspec"
require "core/board"
require "core/hard_machine"

RSpec.describe HardMachine do
  it "chooses a winning move when it has the occasion" do
    move = get_best_move([
      "X", " ", "X",
      " ", "O", " ",
      " ", " ", "O"
    ])

    expect(move).to eql(1)
  end

  it "chooses a winning move when it has the occasion (II)" do
    move = get_best_move([
      "X", " ", " ",
      " ", "O", " ",
      "X", " ", "O"
    ])

    expect(move).to eql(3)
  end

  it "chooses a blocking move when the opponent is going to win in the following turn" do
    move = get_best_move([
      " ", " ", "X",
      " ", "O", " ",
      "X", " ", "O"
    ])

    expect(move).to eql(0)
  end

  it "chooses a blocking move when the opponent is going to win in the following turn (II)" do
    move = get_best_move([
      " ", " ", "X",
      "X", " ", "O",
      "O", " ", "O"
    ])

    expect(move).to eql(7)
  end

  it "gives a winning move a score of 10" do
    board = Board.create_from_array([
      "X", " ", " ",
      "X", "O", " ",
      "X", " ", "O"
    ])
    player = HardMachine.new("X")
    score = player.score(board)
    expect(score).to eql(10)
  end

  it "gives a loosing move a score of -10" do
    board = Board.create_from_array([
      "O", " ", " ",
      " ", "O", " ",
      "X", "X", "O"
    ])
    player = HardMachine.new("X")
    score = player.score(board)
    expect(score).to eql(-10)

  end

  def get_best_move(game_status)
    board = Board.create_from_array(game_status)
    player = HardMachine.new("X")
    player.get_move(board)
  end
end