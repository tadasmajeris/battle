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

  describe '#attack' do
    it "damages the player" do
      expect(player2).to receive(:receive_damage)
      player1.attack(player2)
    end
  end

  describe '#receive damage' do
    it "reduces the player HP" do
      expect { player1.receive_damage }.to change {player1.hit_points}.by(-10)
    end
  end
end
