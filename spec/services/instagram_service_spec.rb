require 'rails_helper'

describe "Instagram Service" do
  context '.initialize(uid, token)' do
    it 'returns a valid object' do
      VCR.use_cassette('.initialize') do
        user = User.from_omniauth(stub_omniauth)

        service = InstagramService.new(user.uid, user.token)

        expect(service).to be_a(InstagramService)
      end
    end
  end
end
