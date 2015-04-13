require 'rails_helper'

feature 'any visitor views a venue\'s details page' do
  context 'as a visitor' do

    scenario 'visitor views a venue\'s details page'  do
      show = FactoryGirl.create(:show)

      visit venue_path(show.venue)

      expect(page).to have_content("Foo Fighters")
      expect(page).to have_content("Brighton Music Hall")
      expect(page).to have_content("2015-04-13")
      expect(page).to have_content("19:00:00")
    end
  end
end
