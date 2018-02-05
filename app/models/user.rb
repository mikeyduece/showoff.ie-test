class User < ApplicationRecord
  before_save :biography

  def self.from_omniauth(auth)
    user = User.where(uid: auth['uid']).first
    if user && user.token != auth['credentials']['token'] ||
        user.profile_pic != auth['info']['image'] ||
        user.bio != auth['info']['bio'] ||
        user.nickname != auth['info']['nickname'] ||
        user.full_name != auth['info']['name']
      user = User.update(uid: auth["uid"],
                         full_name: auth["info"]["name"],
                         profile_pic: auth["info"]["image"],
                         nickname: auth['info']['nickname'],
                         bio: auth['info']['bio'],
                         token: auth["credentials"]["token"]).first
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

  def own_pics
    CreateIgPic.new(self.uid, self.token).owned_pics
  end

  private

    def biography
      self.bio = self.bio.split
    end


end
