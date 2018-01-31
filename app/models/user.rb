class User < ApplicationRecord

  def self.from_omniauth(auth)
    require 'pry'; binding.pry
    user = User.where(uid: auth['uid']).first
    if user.nil?
      user = User.create(uid: auth['uid'],
                         username: auth['info']['username'],
                         profile_pic: auth['info']['profile_picture'],
                         bio: auth['info']['bio'])
    end
    user
  end
end
