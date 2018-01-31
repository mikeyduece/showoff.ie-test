require 'rails_helper'

feature 'As a User I can' do
  scenario 'view basic profile information' do
    stub_omniauth

    visit '/'
    click_on('Login with Instagram')

    user = User.last

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.bio)
    expect(page).to have_content(user.profile_picture)
  end
end
