require 'rails_helper'

feature 'visitor upvotes reviews' do
  context 'as an authorized user' do
    scenario 'I can downvote a show' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      show = FactoryGirl.create(:show)
      visit show_path(show)

      click_link "▼"
      expect(page).to have_content("-1")
    end
  end

  context 'as a visitor' do
    scenario 'I am redirected to login if I try to upvote a review' do

      show = FactoryGirl.create(:show)
      visit show_path(show)

      click_link "▼"
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Remember me")
    end
  end
end
