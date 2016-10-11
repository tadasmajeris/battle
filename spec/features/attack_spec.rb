feature 'Attack' do
	scenario 'attacking player 2' do
		sign_in_and_play
		click_button('attack_player_2')
		expect(page).to have_content "Antony attacked Tadas!"
	end
end