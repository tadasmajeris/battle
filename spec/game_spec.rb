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

  describe '#attacker' do
    it "Player 1 turn by default" do
      expect(game.attacker).to eq player1
    end
  end

  describe '#switch_turn' do
    it "switches player turn" do
      game.switch_turn
      expect(game.attacker).to eq player2
    end
  end

  describe '#opponent_of' do
    it 'finds the opponent of a player' do
      expect(game.opponent_of(player1)).to eq player2
      expect(game.opponent_of(player2)).to eq player1
    end
  end
end
