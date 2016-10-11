require 'spec_helper'

feature 'Attack' do
  scenario 'player 1 attacks player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end

  scenario 'reduce player 2 hit points by 10' do
    sign_in_and_play
    click_link 'Attack'
    click_link 'OK'
    expect(page).not_to have_content 'Mittens: 60hp'
    expect(page).to have_content 'Mittens: 50hp'
  end
end
