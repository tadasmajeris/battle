
require 'game'
require 'player'

describe Game do
subject {described_class.new(dave, mittens)}
let (:dave) {double(:player)}
let (:mittens) {double(:player)}

  describe '#initialize' do
    it 'takes player names' do
      expect(subject.player_1).to eq dave
      expect(subject.player_2).to eq mittens
    end
  end

  describe '#attack' do
    it 'deals damage to oposing player' do
      expect(mittens).to receive(:receive_damage)
      subject.attack(mittens)
    end
  end

  describe '#current_turn' do
    it 'starts as player_1' do
      expect(subject.current_turn).to eq dave
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      subject.switch_turns
      expect(subject.current_turn).to eq mittens
    end
  end

end
