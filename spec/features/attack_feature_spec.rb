require 'spec_helper'

feature "Attacking" do
  scenario "Attack Player 2 and get a confirmation" do
    sign_in_and_attack
    expect(page).to have_content("Dave attacked Timmy")
  end

  scenario "Player 2 switch turns and attacks Player 1" do
    sign_in_and_play
    attack_and_confirm
    click_button "Attack"
    expect(page).to have_content("Timmy attacked Dave")
  end

  scenario "Player 2 loses HP when attacked" do
    sign_in_and_play
    allow(Game.instance.defender).to receive(:random_damage).and_return(10)
    click_button "Attack"
    expect(page).not_to have_content("Timmy HP: 100")
    expect(page).to have_content("Timmy HP: 90")
  end
end
