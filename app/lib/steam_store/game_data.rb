module SteamStore
  class GameData
    def self.for_steamid(steamid)
      client = SteamStore::Client.new('https://store.steampowered.com/')
      result = client.get('/api/appdetails', params: {appids: steamid})

      if result
        result.dig(steamid.to_s, 'data')
      else
        {}
      end
    end
  end
end
