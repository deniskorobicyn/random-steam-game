module Games
  module Steam
    class FetchGenres
      include Interactor

      delegate :game, to: :context
      def call
        steam_data = SteamStore::GameData.for_steamid(game.steam_appid)

        # Game no loger available in the store
        context.fail! unless steam_data

        # No Genre info is available on Steam store
        context.fail! unless steam_data['genres']

        context.genres = steam_data['genres'].map { |genre| genre['description'] }
      end
    end
  end
end
