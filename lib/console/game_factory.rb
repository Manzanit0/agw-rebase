require "console/player_factory"
require "core/game"

class GameFactory
  def create_game(option)
    p_factory = PlayerFactory.new
    player1, player2 = nil, nil

    case option
    when "1"
      player1 = p_factory.create_player("Human", "X")
      player2 = p_factory.create_player("Human", "O")
    when "2"
      player1 = p_factory.create_player("Human", "X")
      player2 = p_factory.create_player("Computer", "O")
    when "3"
      player1 = p_factory.create_player("Computer", "X")
      player2 = p_factory.create_player("Human", "O")
    when "4"
      player1 = p_factory.create_player("Computer", "X")
      player2 = p_factory.create_player("Computer", "O")
    else
      raise NotImplementedError.
        new("#{option}# is not a valid game option.")
    end

    game = Game.new(player1, player2)
  end
end
