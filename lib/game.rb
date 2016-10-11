class Game

  attr_reader :target_player

	def initialize(player1,player2)
		@players = [player1,player2]
    @target_player = player2
	end

  def attack_current_target
    target_player.damage(10)
    "#{current_player.name} attacked #{target_player.name}!"
  end

  def player1
  	@players[0]
  end

  def player2
  	@players[1]
  end

  def switch
    @target_player = (target_player == player2) ? player1 : player2
  end

  def current_player
    (target_player == player2) ? player1 : player2
  end
end
