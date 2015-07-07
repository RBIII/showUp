feature 'an authroized user can review a band' do

  context 'as an authroized user' do
    scenario 'I can write a review for a band' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      band = FactoryGirl.create(:band)
      visit band_path(band)

      fill_in 'Body', with: 'This is a dope band!'
      select '5', from: 'Rating'

      click_on 'Create review'
      expect(page).to have_content('Successfully created review')
    end
  end
end
