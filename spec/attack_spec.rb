require 'spec_helper'

describe Attack do
  subject(:attack) { described_class }
  let(:defender) { double :defender }

  describe '.run' do
    it "damages the player" do
      expect(defender).to receive(:receive_damage)
      attack.run(defender)
    end
  end
end
