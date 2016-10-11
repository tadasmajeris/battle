
require 'game'
require 'player'

describe Game do
subject {described_class.new}
let (:dave) {double(:player)}
let (:mittens) {double(:player)}

  describe '#attack' do
    it 'deals damage to oposing player' do
      expect(mittens).to receive(:receive_damage)
      subject.attack(mittens)
    end
  end

end
