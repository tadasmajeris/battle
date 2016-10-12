class Game
  attr_reader :current_player, :target_player

  def initialize(player1, player2)
    @players = [player1, player2]
    @target_player = player2
    @current_player = player1
    @over = false
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack(player)
    player.receive_damage
    @over = player.dead? 
  end

  def over?
    @over
  end

  def switch
    @current_player = target_player
    @target_player = (target_player == player2) ? player1 : player2
  end
end
