feature 'an authroized user can review a show' do

  context 'as an authroized user' do
    scenario 'I can write a review for a show' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)

      show = FactoryGirl.create(:show)
      visit show_path(show)

      fill_in 'Body', with: 'This was a dope show!'
      select '5', from: 'Rating'

      click_on 'Create review'
      expect(page).to have_content('Successfully created review')
    end
  end
end
