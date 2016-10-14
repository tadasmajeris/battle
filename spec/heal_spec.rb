require 'heal'

describe Heal do

  let(:player) { double :player }
  subject {described_class.new(player)}


  describe '#run' do
    it 'should heal the player' do
      expect(player).to receive(:heal)
      subject.run
    end
  end
end
