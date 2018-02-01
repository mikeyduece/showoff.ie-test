require 'rails_helper'

feature 'As a User I can' do
  scenario 'view basic profile information' do
    VCR.use_cassette('login') do
      stub_omniauth

      visit '/'
      click_on('Login with Instagram', match: :first)
      user = User.last

      expect(page).to have_content(user.nickname)
      expect(page).to have_content(user.full_name)
      expect(page).to have_content(user.bio)
      expect(page).to have_content(user.profile_picture)
    end
  end
end
