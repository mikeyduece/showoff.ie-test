class User < ApplicationRecord

  def self.from_omniauth(auth)
    user = User.where(uid: auth['data']['uid']).first
    if user.nil?
      user = User.create(uid: auth['data']['id'],
                         username: auth['data']['username'],
                         profile_pic: auth['data']['profile_picture'],
                         bio: auth['data']['bio'])
    end
    user
  end
end
