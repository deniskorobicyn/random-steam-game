module Games
  class SyncSteamGendresService
    def initialize(game)
      @game = game
    end

    def call
      steam_genres && steam_genres.all? do |hash|

        genre = Genre.find_or_initialize_by(description: hash['description'])

        genre.save && @game.game_genres.find_or_initialize_by(genre_id: genre.id).save
      end
    end

    private

    def steam_genres
      return @steam_genres if defined?(@steam_genres)
      steam_data = Rails.cache.fetch(@game.name) do
        SteamStore::GameData.for_steamid(@game.steam_appid)
      end

      @steam_genres = steam_data.present? ? steam_data['genres'] : []
    end
  end
end