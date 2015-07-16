feature 'authroized user reviews venue' do
  context 'as an authorized user' do
    scenario 'I can review a venue' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      venue = FactoryGirl.create(:venue)
      visit venue_path(venue)

      fill_in 'Body', with: 'This was a dope show!'
      select '5', from: 'Rating'

      click_on 'Create review'
      expect(page).to have_content('Successfully created review')
    end
  end
end
