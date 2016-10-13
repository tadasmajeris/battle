require 'spec_helper'

feature 'Heal' do
  scenario 'Player 1 gains hit points' do
    sign_in_and_play
    allow(Game.instance.attacker).to receive(:random_heal).and_return(10)
    click_button 'Heal'
    expect(page).to have_content('Dave HP: 110')
  end

  scenario 'Player 1 heals' do
    sign_in_and_play
    click_button 'Heal'
    expect(page).to have_content('Dave healed')
  end
end
