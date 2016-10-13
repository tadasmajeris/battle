require 'spec_helper'

describe Attack do
  let(:defender) { double :defender }
  subject { Attack.new(defender) }

  describe '.use' do
    it "damages the player" do
      expect(defender).to receive(:receive_damage)
      Attack.use(defender)
    end
  end
end
