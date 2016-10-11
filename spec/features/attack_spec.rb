require 'spec_helper'

RSpec.feature "Attacking", :type => :feature do
  scenario "Attack Player 2 and get a confirmation" do
    sign_in_and_attack
    expect(page).to have_content("Dave attacked Timmy")
  end

  scenario "Player 2 loses HP when attacked" do
    sign_in_and_attack
    expect(page).not_to have_content("Timmy HP: 100")
    expect(page).to have_content("Timmy HP: 90")
  end
end
