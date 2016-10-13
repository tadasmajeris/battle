require_relative 'game'

class Player
  attr_reader :name, :hit_points

  DEFAULT_HP = 100

  def initialize(name, hit_points = DEFAULT_HP)
    @name = name.empty? ? 'Godzilla' : name
    @hit_points = hit_points
  end

  def receive_damage
    @hit_points -= random_damage
  end

  def random_damage
    rand(10..30)
  end
end
