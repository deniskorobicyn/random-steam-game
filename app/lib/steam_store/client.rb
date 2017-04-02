module SteamStore
  class Client
    def initialize(url)
      @conn = Faraday.new(url: url)
    end

    def get(resource, params: {})
      response = @conn.get resource, params
      JSON.parse(response.body)
    rescue JSON::ParserError
      nil
    end
  end
end