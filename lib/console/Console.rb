class Console
  def initialize(cli)
    @cli = cli
  end

  def print_board(board)
    puts "\e[H\e[2J" # Clears console

    @cli.say "_____________\n"
    (0...board.size).each do |i|
      @cli.say "| "
      (0...board.size).each do |j|
        token = board.tile(i, j)
        @cli.say "#{token} | "
      end
      @cli.say "\n_____________\n"
    end
  end

  def request_move
    answer = @cli.ask("Please input your move  (row,column)  ") { |q| q.validate = /^([0-9]),([0-9])$/ }
    answer.split(",").map { |s| s.to_i }
  end
end
