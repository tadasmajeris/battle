def sign_in_and_play
  visit "/"
  fill_in "player1_name", :with => "Dave"
  fill_in "player2_name", :with => "Timmy"
  click_button "Submit Players"
end

def sign_in_and_attack
  sign_in_and_play
  click_button "Attack"
end

def attack_and_confirm
  click_button "Attack"
  click_button "OK"
end
