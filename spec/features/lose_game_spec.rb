require 'spec_helper'

feature "Lose game" do
  scenario "Player 2 gets attacked 10 times and sees lose game message" do
    sign_in_and_play
    18.times do
      allow(Game.instance.defender).to receive(:random_damage).and_return(10)
      attack_and_confirm
    end
    click_button "Attack"
    expect(page).to have_content("Timmy has lost the game")
  end
end
