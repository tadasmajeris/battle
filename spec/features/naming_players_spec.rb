require 'spec_helper'

RSpec.feature "naming Players", :type => :feature do
  scenario "Expects players to fill in their names" do
    visit "/"

    fill_in "Player 1", :with => "Dave"
    fill_in "Player 2", :with => "Timmy"
    click_button "Submit Players"

    expect(page).to have_text("Players have been successfully created")
  end
end
