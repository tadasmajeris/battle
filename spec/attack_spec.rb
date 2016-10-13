require 'spec_helper'

describe Attack do
  let(:player) { double :player, name: 'Dave' }
  subject { Attack.new(player) }

  describe '#run' do
    it 'damages the player' do
      expect(player).to receive(:receive_damage)
      subject.run
    end

    it 'should return a confirmation' do
      allow(player).to receive(:receive_damage)
      expect(subject.run).to eq "#{player.name} was attacked"
    end
  end
end
