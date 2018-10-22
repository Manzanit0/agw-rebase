require "core/players/player"

class CliPlayer < Player
  def initialize(symbol, output = $stdout, input = $stdin)
    super(symbol)
    @out = output
    @in = input
  end

  def get_move(board)
    @out.print "\nPlease input your move (row,column): "
    answer = @in.gets.chomp
    r = /^([0-9]),([0-9])$/ #FIXME validate also size.

    until answer.match r
      @out.print "Please input the move with the following format (row,column): "
      answer = @in.gets.chomp
    end

    # TODO validate move is not taken.

    answer.split(",").map { |s| s.to_i }
  end
end
