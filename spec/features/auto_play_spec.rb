require 'spec_helper'

feature 'Auto Play' do
  scenario 'battle a computerised opponent' do
    sign_in_and_play_lonely
    click_button 'Attack'
    expect(page).to have_content('Dave attacked Godzilla')
    expect(page).to have_content('Godzilla attacked Dave')
  end

  scenario 'player 1 and computerised opponent lose hp' do
    sign_in_and_play_lonely
    allow(Game.instance.defender).to receive(:random_damage).and_return(10)
    allow(Game.instance.attacker).to receive(:random_damage).and_return(10)
    click_button 'Attack'
    expect(page).not_to have_content('Godzilla HP: 100')
    expect(page).to have_content('Godzilla HP: 90')
    expect(page).not_to have_content('Dave HP: 100')
    expect(page).to have_content('Dave HP: 90')
  end
end
