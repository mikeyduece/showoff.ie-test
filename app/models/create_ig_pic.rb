class CreateIgPic

  def initialize(uid, token)
    @uid   = uid
    @token = token
  end

  def owned_pics
    pics = []
    raw_pics.map do |raw|
      pics << IgPic.new(raw)
    end
    pics
  end

  private
    attr_reader :uid, :token

    def raw_pics
      service.own_pics[:data]
    end

    def service
      InstagramService.new(uid, token)
    end

end
