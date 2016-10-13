class Action
  attr_reader :player

  def initialize(player)
    @player = player
  end

  def self.use(player)
    new(player).run
  end

  def run
    # Implement in sub-class
  end

end
