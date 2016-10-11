feature 'finish' do
	scenario 'target player health = 0' do
		sign_in_and_play
		allow(Game.instance).to receive(:random_damage).and_return(10)
		attack_5_times
		click_button('attack Tadas')
		expect(page).not_to have_css "form"
		expect(page).to have_content "Tadas is dead"
	end
end