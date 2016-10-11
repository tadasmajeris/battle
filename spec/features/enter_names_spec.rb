feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    click_button 'Submit'
    expect(page).to have_content 'Antony vs. Tadas'
  end
end
