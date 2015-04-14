require 'rails_helper'

feature 'a visitor views a band\'s details page' do

  context 'as an authroized user' do
    scenario 'I can write a review for a band' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      band = FactoryGirl.create(:band)
      visit band_path(band)

      fill_in 'Body', with: 'This was a dope band!'
      select '5', from: 'Rating'

      click_on 'Create review'
      expect(page).to have_content('Successfully created review')
    end
  end

  context 'as a visitor' do

    scenario 'I can view a bands\'s details page'  do
      show = FactoryGirl.create(:show)

      visit band_path(show.band)

      expect(page).to have_content("Foo Fighters")
      expect(page).to have_content("Brighton Music Hall")
      expect(page).to have_content("2015-04-13")
      expect(page).to have_content("19:00:00")
    end
  end
end
