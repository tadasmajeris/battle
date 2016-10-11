describe 'switch turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Dave's turn"
    end

    scenario 'after Dave attacks' do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content "It's Dave's turn!"
      expect(page).to have_content "It's Mittens's turn!"
    end
  end
end
