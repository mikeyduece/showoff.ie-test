require 'rails_helper'

feature 'User' do
  scenario 'cannot view another users profile info' do
    VCR.use_cassette('bad_url') do
      stub_omniauth
      visit root_path
      click_link('Login with Instagram')

      expect(current_path).to eq(user_path(User.last))

      visit '/users/30'

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  scenario 'cannot view info if not logged in' do
    visit 'users/30'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You Must Log in or Register to View this Page")
  end
end
