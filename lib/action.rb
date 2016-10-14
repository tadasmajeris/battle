class Action

  def initialize(player)
    @player = player
  end

  def self.use(player)
    new(player).run
  end

  def run
    # to be implemented
  end
end
