require_relative "action"

class Attack < Action

  def run
    @player.receive_damage
  end

end
