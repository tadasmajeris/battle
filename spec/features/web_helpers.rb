def sign_in_and_play
	visit('/')
  fill_in :player_1_name, with: 'Antony'
  fill_in :player_2_name, with: 'Tadas'
  click_button 'Submit'
end