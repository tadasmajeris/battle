class Attack
  def initialize(defender)
    @defender = defender
  end

  def self.run(defender)
    new(defender).run
  end

  def run
    @defender.receive_damage
  end
end
