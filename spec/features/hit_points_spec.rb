feature 'hit points' do
  scenario 'entering the battle' do
    sign_in_and_play
    expect(page).to have_content "Tadas: 60HP"
  end
end
