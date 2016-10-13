require 'spec_helper'

describe Heal do
  let(:player) { double :player, name: 'Timmy' }
  subject { Heal.new(player) }

  describe '#run' do
    it "heals the player" do
      expect(player).to receive(:heal)
      subject.run
    end

    it 'should return a confirmation' do
      allow(player).to receive(:heal)
      expect(subject.run).to eq "#{player.name} healed"
    end
  end
end
