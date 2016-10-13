require_relative 'player'

class Game
  attr_reader :attacker, :defender, :current_attack

  def initialize(player1, player2)
    @players = [player1, player2]
    @attacker = player1
    @defender = player2
  end

  def self.create(player1, player2, automate)
    @game = Game.new(player1, player2)
    @game.set_automation(automate)
  end

  def self.instance
    @game
  end

  def save_current_attack(attack)
    @current_attack = attack
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def set_automation(boolean)
    @automated = boolean
  end

  def automated?
    @automated
  end

  def switch_turn
    @attacker = opponent_of(attacker)
    @defender = opponent_of(defender)
  end

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

  def end_game?
    @players.first.hit_points <= 0 || @players.last.hit_points <= 0
  end

  def loser
    @players.select { |player| player.hit_points <= 0 }.first
  end
end
