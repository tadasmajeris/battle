require 'poison'

describe Poison do

  let(:player) {double(:player)}
  subject {Poison.new(player)}

  describe '#run' do
    it 'should poison the player' do
      expect(player).to receive(:poison)
      subject.run
    end
  end
end
