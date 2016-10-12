require 'spec_helper'

RSpec.feature "Lose game", :type => :feature do
  scenario "Player 2 gets attacked 10 times and sees lose game message" do
    sign_in_and_play
    9.times do
      click_button "Attack"
      click_button "OK"
    end
    click_button "Attack"
    expect(page).to have_content("Timmy has lost the game")
  end
end
