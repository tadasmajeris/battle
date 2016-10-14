require_relative "action"

class Heal < Action

  def run
    @player.heal
  end

end
