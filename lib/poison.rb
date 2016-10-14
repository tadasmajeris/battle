require_relative "action"

class Poison < Action

  def run
    @player.poison
  end

end
