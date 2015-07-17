require 'rails_helper'

feature 'any visitor views a list of all venues' do
  context 'as a visitor' do

    scenario 'I can view a list of all venues' do
      FactoryGirl.create(:venue)
      
      visit venues_path
      expect(page).to have_content("Brighton Music Hall")
    end
  end
end
