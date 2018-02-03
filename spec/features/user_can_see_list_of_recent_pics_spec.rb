require 'rails_helper'

feature 'As a User I can' do
  scenario 'view recent uploaded images' do
    VCR.use_cassette('user_pics') do
      stub_omniauth
      uid = stub_omniauth['info']['uid']

      visit '/'
      click_link('Login with Instagram')

      expect(current_path).to eq(user_path(User.last))
      expect(page).to_not have_css('.post-image', count: 1)
    end
  end
end
