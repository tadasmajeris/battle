require_relative 'action'

class Heal < Action

  def run
    @player.heal
    "#{@player.name} healed"
  end

end
