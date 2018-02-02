class User < ApplicationRecord

  def self.from_omniauth(auth)
    user = User.where(uid: auth['uid']).first
    if user && user.token != auth['credentials']['token']
      user = User.update(uid: auth["uid"],
                         full_name: auth["info"]["name"],
                         profile_pic: auth["info"]["image"],
                         nickname: auth['info']['nickname'],
                         bio: auth['info']['bio'],
                         token: auth["credentials"]["token"])

    elsif user.nil?
      user = User.create(uid: auth["uid"],
                         full_name: auth["info"]["name"],
                         profile_pic: auth["info"]["image"],
                         nickname: auth['info']['nickname'],
                         bio: auth['info']['bio'],
                         token: auth["credentials"]["token"])
    end

    user
  end

end
