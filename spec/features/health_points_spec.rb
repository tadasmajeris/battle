require 'spec_helper'

RSpec.feature "Health Points", :type => :feature do
  scenario "Player 2 has hit points" do
    visit "/"

    fill_in "player1_name", :with => "Dave"
    fill_in "player2_name", :with => "Timmy"
    click_button "Submit Players"

    expect(page).to have_content("Timmy HP: 100")
  end
end
