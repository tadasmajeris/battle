feature 'Attack' do
	scenario 'attacking player 2' do
		sign_in_and_play
		click_button('attack Tadas')	
		expect(page).to have_content "Antony attacked Tadas!"
	end

	scenario 'attack reduces player 2\'s HP' do
		sign_in_and_play
		allow(Game.instance).to receive(:random_damage).and_return(10)
		click_button('attack Tadas')
		expect(page).not_to have_content "Tadas: 60HP"
		expect(page).to have_content "Tadas: 50HP"
	end

	scenario 'attack reduces player1\'s Hp' do
		sign_in_and_play
		allow(Game.instance).to receive(:random_damage).and_return(10)
		click_button('attack Tadas')
		click_button('attack Antony')
		expect(page).not_to have_content "Antony: 60HP"
		expect(page).to have_content "Antony: 50HP"
	end
end
