require 'spec_helper'

RSpec.feature "Naming Players", :type => :feature do
  scenario "Expects players to fill in their names" do
    sign_in_and_play
    expect(page).to have_content("Dave vs. Timmy")
  end
end
