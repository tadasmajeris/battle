require 'spec_helper'

RSpec.feature "Attacking", :type => :feature do
  scenario "Attack Player 2 and get a confirmation" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content("Dave attacked Timmy")
  end
end
