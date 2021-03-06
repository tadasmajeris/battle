require 'game'

describe Game do
  let(:player1) { double :player, name: 'Antony', dead?: false }
  let(:player2) { double :player, name: 'Tadas', dead?: false }
  subject { described_class.new(player1,player2) }

  describe 'initialize' do
    it 'sets player 2 as target' do
      expect(subject.target_player).to eq player2
    end
  end

  describe '#switch' do
    it 'switches the target player' do
      subject.switch
      expect(subject.target_player).to eq player1
    end
  end

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

  describe '#attack_current_target' do
    context 'player1 attacks player2' do
      it 'attacks a player2' do
        expect(player2).to receive(:damage)
        subject.attack_current_target
      end
      it 'returns a confirmation message' do
        allow(player2).to receive(:damage)
        expect(subject.attack_current_target).to eq "#{player1.name} attacked #{player2.name}!"
      end
      it 'returns a message with the losing players name' do
        allow(player2).to receive(:dead?).and_return(true)
        allow(player2).to receive(:damage)
        expect(subject.attack_current_target).to eq "#{player2.name} is dead"
      end
    end
  end
  describe '#random_damage' do
    it 'returns a random number' do
      expect(5..20).to include(subject.random_damage)
    end
  end
end
