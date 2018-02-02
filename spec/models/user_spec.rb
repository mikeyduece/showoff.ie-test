require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Class Methods' do
    it '.from_omniauth' do
      User.from_omniauth(stub_omniauth)

      user = User.last
      expect(user).to be_a(User)
    end
  end
end
