module Games
  class SyncSteamGamesService
    def initialize(user)
      @user = user
    end

    def sync
      games.each_with_index do |game_hash, index|
        game = Game.find_or_initialize_by(
          steam_appid: game_hash['appid']
        )

        game.name = game_hash['name']
        game.image_url = game_hash['img_logo_url']

        game_user = game.user_games.find_or_initialize_by(user: @user)

        saved = game.save && game_user.save

        yield(saved, index) if block_given?
      end
    end

    def total
      games_json['game_count']
    end

    private

    def games
      games_json['games']
    end

    def games_json
      @games_json ||=
        Steam::Player.owned_games(
          @user.steamid,
          params: {
            include_appinfo: '1',
            include_played_free_games: '1'
          }
        )
    end
  end
end
