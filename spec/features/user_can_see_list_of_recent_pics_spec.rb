require 'rails_helper'

feature 'As a User I can' do
  scenario 'view recent uploaded images' do
    VCR.use_cassette('user_pics') do
      stub_omniauth

      visit '/'
      click_link('Login with Instagram')
      find('.glyphicon.glyphicon-user').click

      user = User.last
      pics = user.own_pics

      expect(current_path).to eq(user_path(User.last))

      within('.post-image', match: :first) do
        expect(page.find('.ig-post-pic')['src']).to have_content(user.own_pics[0].image)
      end

      expect(page).to have_css('.post-image')
      expect(page).to have_css('.caption')
      expect(page).to have_css('.likes')
      expect(page).to have_css('.tags')
      expect(page).to have_content(pics[0].caption)
    end
  end
end
