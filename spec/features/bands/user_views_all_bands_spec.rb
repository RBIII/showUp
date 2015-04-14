require 'rails_helper'

feature 'any visitor views a list of all venues' do
  context 'as a visitor' do

    scenario 'I can view a list of all venues' do
      FactoryGirl.create(:band)
      FactoryGirl.create(:band)
      FactoryGirl.create(:band)

      visit bands_path
      expect(page).to have_content("Foo Fighters - 1")
      expect(page).to have_content("Foo Fighters - 2")
      expect(page).to have_content("Foo Fighters - 3")
    end
  end
end
