require 'rails_helper'

feature 'User' do
  scenario 'can signout' do
    VCR.use_cassette('logout') do
      stub_omniauth

      visit root_path
      click_link('Login with Instagram')
      user = User.last
      find('.glyphicon.glyphicon-log-out').click

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content(user.nickname)
    end
  end
end
