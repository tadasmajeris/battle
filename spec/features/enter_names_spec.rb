feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Antony'
    fill_in :player_2_name, with: 'Tadas'
    click_button 'Submit'
    expect(page).to have_content 'Antony vs. Tadas'
  end
end
