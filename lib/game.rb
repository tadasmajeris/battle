class Game
  attr_reader :current_player, :target_player

  def initialize(player1, player2)
    @players = [player1, player2]
    @target_player = player2
    @current_player = player1
    @over = false
    @auto = player2.name == :computer
  end

  def auto?
    @auto
  end

  def self.instance
    @game
  end

  def self.create(player1, player2)
    @game = Game.new(player1, player2)
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  def attack_current_target
    target_player.receive_damage
    @over = target_player.dead?
    "#{current_player.name} attacked #{target_player.name}"
  end

  def paralyse_current_target
    target_player.paralyse
    @over = target_player.dead?
    if target_player.missing_turn
      "#{current_player.name} paralysed #{target_player.name}"
    else
      "#{current_player.name} tried to paralyse #{target_player.name} but failed"
    end
  end

  def sleep_current_target
    target_player.sleep
    @over = target_player.dead?
    if target_player.missing_turn
      "#{current_player.name} put #{target_player.name} to sleep"
    else
      "#{current_player.name} tried to put #{target_player.name} to sleep but failed"
    end
  end

  def target_hp
    "#{target_player.name} HP: #{target_player.hit_points}"
  end

  def over?
    @over
  end

  def switch
    @current_player = target_player
    @target_player = (target_player == player2) ? player1 : player2
  end
end
