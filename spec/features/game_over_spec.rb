require 'spec_helper'

feature 'Game over' do

  scenario 'When Player 1 reaches 0 hp first, he loses' do
    sign_in_and_play
    allow(Game.instance.player_1).to receive(:random_damage).and_return(10)
    allow(Game.instance.player_2).to receive(:random_damage).and_return(10)
    10.times { attack_and_confirm }
    click_button 'Attack'
    expect(page).to have_content 'Mittens loses!'
  end

end
