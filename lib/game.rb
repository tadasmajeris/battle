class Game

	def initialize(player1,player2)
		@players = [player1,player2]
	end
  
  def attack(player1, player2)
    player2.damage(10)
    "#{player1.name} attacked #{player2.name}!"
  end

  def player1
  	@players[0]
  end

  def player2
  	@players[1]
  end
end 
