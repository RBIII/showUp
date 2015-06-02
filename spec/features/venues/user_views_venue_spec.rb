require 'rails_helper'

feature 'a visitor views a venue\'s details page' do
  context 'as an authroized user' do
    scenario 'I can write a review for a venue' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      venue = FactoryGirl.create(:venue)
      visit venue_path(venue)

      fill_in 'Body', with: 'This was a dope venue!'
      select '5', from: 'Rating'

      click_on 'Create review'
      expect(page).to have_content('Successfully created review')
    end
  end

  context 'as any visitor' do
    scenario 'I can view a venue\'s details page'  do
      show = FactoryGirl.create(:show)

      visit venue_path(show.venue)

      expect(page).to have_content("Foo Fighters")
      expect(page).to have_content("Brighton Music Hall")
      expect(page).to have_content("2015-04-13")
      expect(page).to have_content("19:00:00")
    end
  end
end
