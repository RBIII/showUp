require 'rails_helper'

feature 'any visitor views a list of all venues' do
  context 'as a visitor' do

    scenario 'visitor views a list of all venues' do
      FactoryGirl.create(:venue)
      FactoryGirl.create(:venue)
      FactoryGirl.create(:venue)

      visit venues_path
      expect(page).to have_content("Brighton Music Hall - 2")
      expect(page).to have_content("Brighton Music Hall - 3")
      expect(page).to have_content("Brighton Music Hall - 4")
    end
  end
end
