require 'spec_helper'

RSpec.feature "Health Points", :type => :feature do
  scenario "Player 2 has hit points" do
    sign_in_and_play
    expect(page).to have_content("Timmy HP: 100")
  end

  scenario "Player 1 has hit points" do
    sign_in_and_play
    expect(page).to have_content("Dave HP: 100")
  end

end
