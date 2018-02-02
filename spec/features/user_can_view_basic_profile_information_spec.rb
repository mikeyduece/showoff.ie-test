require 'rails_helper'

feature 'As a User I can' do
  scenario 'login with instagram' do
    VCR.use_cassette('login') do
      stub_omniauth

      visit root_path
      click_link('Login with Instagram')

      user = User.last

      expect(page).to have_content(user.nickname)
      expect(page).to have_content(user.full_name)
      expect(page).to have_content(user.bio)
      expect(page.find('.rounded-circle')['src']).to have_content(user.profile_pic)
    end
  end
end
