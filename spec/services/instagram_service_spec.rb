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

  context 'instance methods' do
    it '#get_url' do
      VCR.use_cassette('.own_pics') do
        user = User.from_omniauth(stub_omniauth)
        url     = "users/#{user.uid}/media/recent/"
        service = InstagramService.new(user.uid, user.token)

        expect(service.own_pics).to be_instance_of(Hash)
        expect(service.own_pics[:data]).to be_instance_of(Array)
        expect(service.own_pics[:data].count).to_not eq(0)
      end
    end
  end
end
