require 'spec_helper'

describe Game do
  subject(:game) { Game.new(player1, player2) }

  let(:player1) { Player.new('Dave') }
  let(:player2) { Player.new('Timmy') }

  describe '#player1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq player1
    end
  end

  describe '#player2' do
    it 'retrieves the last player' do
      expect(game.player2).to eq player2
    end
  end

  describe '#attack' do
    it "damages the player" do
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end

  describe '#track_turn' do
    it "keeps track of default turn" do
      expect(player1).to receive(:track_turn)
    end
  end

  describe '#switch_turn' do
    it "switches player turn" do
      expect(player1).to receive(: )
    end
  end
end
