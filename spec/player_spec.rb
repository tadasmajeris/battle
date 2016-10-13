require 'spec_helper'

describe Player do
  subject(:player1) { Player.new('Dave') }
  subject(:player2) { Player.new('Timmy') }

  describe '#name' do
    it 'returns its name' do
      expect(player1.name).to eq('Dave')
    end
  end

  describe '#hit points' do
    it "returns the hitpoints " do
      expect(player1.hit_points).to eq(Player::DEFAULT_HP)
    end
  end

  describe '#receive damage' do
    it "reduces the player HP by a given damage" do
      allow(player1).to receive(:random_damage).and_return(15)
      expect { player1.receive_damage }.to change {player1.hit_points}.by(-15)
    end
  end

  describe '#random_damage' do
    it 'should return a random number from 10..30' do
      expect(10..30).to include(subject.random_damage)
    end
  end
end
