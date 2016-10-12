def sign_in_and_play
  visit "/"
  fill_in "player1_name", :with => "Dave"
  fill_in "player2_name", :with => "Timmy"
  click_button "Submit Players"
end

def sign_in_and_attack
  sign_in_and_play
  click_button "Attack Timmy"
end

def sign_in_and_attack_both
  sign_in_and_attack
  click_button 'OK'
  click_button 'Attack Dave'
end
