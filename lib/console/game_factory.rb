require "console/player_factory"
require "core/game"

module GameOptions
  HUMAN_VS_HUMAN = "1"
  HUMAN_VS_COMPUTER = "2"
  COMPUTER_VS_HUMAN = "3"
  COMPUTER_VS_COMPUTER = "4"
end

class GameFactory
  def create_game(option)
    p_factory = PlayerFactory.new
    player1, player2 = nil, nil

    case option
    when GameOptions::HUMAN_VS_HUMAN
      player1 = p_factory.create_player("Human", "X")
      player2 = p_factory.create_player("Human", "O")
    when GameOptions::HUMAN_VS_COMPUTER
      player1 = p_factory.create_player("Human", "X")
      player2 = p_factory.create_player("Computer", "O")
    when GameOptions::COMPUTER_VS_HUMAN
      player1 = p_factory.create_player("Computer", "X")
      player2 = p_factory.create_player("Human", "O")
    when GameOptions::COMPUTER_VS_COMPUTER
      player1 = p_factory.create_player("Computer", "X")
      player2 = p_factory.create_player("Computer", "O")
    else
      raise NotImplementedError.
        new("#{option}# is not a valid game option.")
    end

    game = Game.new(player1, player2)
  end
end
