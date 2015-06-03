require 'rails_helper'

feature 'authorized user can add tags on a show\'s details page' do
  context 'as an authorized user' do
    scenario 'I can add tags' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      show = FactoryGirl.create(:show)
      visit show_path(show)

      click_link "Add tags"

      fill_in "show_tag_list", with: "indie"
      click_button "Add tags"
      expect(page).to have_content("indie")
    end
  end
end
