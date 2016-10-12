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

    it "should set the game to GAME OVER if the target player dies" do
      10.times { game.attack(player2) }
      expect(game).to be_over
    end
  end

  describe '#over?' do
    it "should be false by default" do
      expect(game).not_to be_over
    end
  end

  describe '#target_player' do
    it 'has player 2 as target player by default' do
      expect(subject.target_player).to eq player2
    end
  end

  describe '#current_player' do
    it 'has player 1 as target player by default' do
      expect(subject.current_player).to eq player1
    end
  end

  describe '#switch' do
    it 'switches the target player' do
      subject.switch
      expect(subject.target_player).to eq player1
    end
    it 'should switch target back to player2 when using twice' do
      subject.switch
      subject.switch
      expect(subject.target_player).to eq player2
    end
  end
end
