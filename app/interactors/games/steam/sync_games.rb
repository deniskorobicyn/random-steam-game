module Games
  module Steam
    class SyncGames
      include Interactor

      delegate :current_user, :progress_proc, :total_proc, to: :context
      def call
        total_proc.call(total) if total_proc.present?

        games.each_with_index do |game_hash, index|
          game = Game.find_or_initialize_by(
            steam_appid: game_hash['appid']
          )

          if game.new_record?
            result = Games::Steam::FetchGenres.call(game: game)

            genres = result.genres if result.success?
          end

          result = Games::Save.call(
            game: game,
            genres_names: genres,
            current_user: current_user,
            params: game_params(game_hash)
          )

          progress_proc.call(result.success?, index) if progress_proc.present?
        end
      end

      private

      def total
        games_json['game_count']
      end

      def games
        games_json['games']
      end

      def game_params(hash)
        {
          name: hash['name'],
          image_url: hash['img_logo_url']
        }
      end

      def games_json
        @games_json ||= Rails.cache.fetch(['steam_games', current_user.id], expires_in: 3.hours) do
          ::Steam::Player.owned_games(
            current_user.steamid,
            params: {
              include_appinfo: '1',
              include_played_free_games: '1'
            }
          )
        end
      end
    end
  end
end
