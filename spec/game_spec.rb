require 'game'

describe Game do
  let(:player1) { double :player, name: 'Antony' }
  let(:player2) { double :player, name: 'Tadas' }
  subject { described_class.new(player1,player2) }

  describe '#player1' do
    it 'returns the first player' do
      expect(subject.player1).to eq player1
    end
  end

  describe '#player2' do
    it 'returns the second player' do
      expect(subject.player2).to eq player2
    end
  end

  describe '#attack' do
    context 'player1 attacks player2' do
      it 'attacks a player2' do
        expect(player2).to receive(:damage).with(10)
        subject.attack(player1, player2)
      end
      it 'returns a confirmation message' do
        allow(player2).to receive(:damage).with(10)
        expect(subject.attack(player1, player2)).to eq "#{player1.name} attacked #{player2.name}!"
      end
    end

    context 'player2 attacks player1' do
      it 'attacks a player1' do
        expect(player1).to receive(:damage).with(10)
        subject.attack(player2, player1)
      end

      it 'returns a confirmation message' do
        allow(player1).to receive(:damage).with(10)
        expect(subject.attack(player2, player1)).to eq "#{player2.name} attacked #{player1.name}!"
      end
    end
  end
end
