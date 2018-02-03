class InstagramService

  def initialize(uid, token=nil)
    @uid = uid
    @conn = Faraday.new("https://api.instagram.com/v1/") do |faraday|
      faraday.params['access_token'] = token
      faraday.adapter Faraday.default_adapter
    end
  end

  def own_pics
    get_url("users/#{uid}/media/recent/")
  end

  private
    attr_reader :uid

    def get_url(url)
      response = @conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
