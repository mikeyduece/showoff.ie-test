require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Class Methods' do
    it '.from_omniauth' do
      User.from_omniauth(stub_omniauth)

      user = User.last
      expect(user).to be_a(User)
    end
  end

  context 'Instance Methods' do
    it '.own_pics' do
      VCR.use_cassette('own_pics') do
        user = User.from_omniauth(stub_omniauth)
        pics = user.own_pics

        expect(pics).to be_a(Array)
        expect(pics[0]).to be_a(IgPic)
      end
    end
  end
end
