class Game
  
  def attack(player1, player2)
    player2.damage(10)
    "#{player1.name} attacked #{player2.name}!"
  end
end
