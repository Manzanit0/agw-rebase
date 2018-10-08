class Tile
  def check(player)
    @player = player
  end

  def is_checked?
    @player != nil
  end

  def get_check
    is_checked? ? @player.symbol : ' '
  end
end
