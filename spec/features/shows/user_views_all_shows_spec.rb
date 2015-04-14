require 'rails_helper'

feature 'a visitor views a list of all shows' do
  context 'as a visitor' do

    scenario 'I can view a list of all venues' do
      FactoryGirl.create(:show)
      FactoryGirl.create(:show)
      FactoryGirl.create(:show)

      visit shows_path
      expect(page).to have_content("Foo Fighters")
      expect(page).to have_content("Brighton Music Hall")
      expect(page).to have_content("2015-04-13")
      expect(page).to have_content("19:00:00")
    end
  end
end
