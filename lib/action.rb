class Action

  def initialize(player)
    @player = player
  end

  def self.use(player)
    new(player).run
  end

  def run
    raise NotImplementedError, 'You must implement the run method'
  end
end
