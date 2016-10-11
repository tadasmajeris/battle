require 'spec_helper'

feature 'Game over' do
  context 'When Player 1 reaches 0 hp first' do
    before do
      sign_in_and_play
      attack_and_confirm
    end

    scenario 'Player 1 loses' do
      click_link 'Attack'
      expect(page).to have_content 'Dave loses!'
    end
  end
end
