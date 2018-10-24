require "console/cli_player"
require "core/machine"

class PlayerFactory
  def create_player(type, symbol)
    case type
    when "Human"
      CliPlayer.new(symbol)
    when "Computer"
      Machine.new(symbol)
      else
        raise NotImplementedError.
          new("#{type}# is not a valid type of player.")
    end
  end
end
