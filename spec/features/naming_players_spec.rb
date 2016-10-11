require 'spec_helper'

RSpec.feature "naming Players", :type => :feature do
  scenario "Expects players to fill in their names" do
    visit "/"

    fill_in "player1_name", :with => "Dave"
    fill_in "player2_name", :with => "Timmy"
    click_button "Submit Players"

    expect(page).to have_content("Dave vs. Timmy")
  end
end
