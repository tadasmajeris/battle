class Game
  attr_reader :attacker, :defender

  def initialize(player1, player2)
    @players = [player1, player2]
    @attacker = player1
    @defender = player2
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turn
    @attacker = opponent_of(attacker)
    @defender = opponent_of(defender)
  end

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

end
