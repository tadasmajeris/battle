require 'spec_helper'

RSpec.feature "Switching Turns", :type => :feature do
  scenario "Player 1 turn to attack by default" do
    sign_in_and_play
    expect(page).to have_content("Dave's Turn to Attack")
  end

  scenario "Player 2 turn to attack after stwitching turns" do
    sign_in_and_play
    click_button "Switch Turns"
    expect(page).to have_content("Timmy's Turn to Attack")
  end
end
