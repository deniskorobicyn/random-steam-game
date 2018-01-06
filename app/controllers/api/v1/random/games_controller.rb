module Api
  module V1
    module Random
      class GamesController < Api::BaseController
        def index
          result = Choosers::PickGame.call(user: current_user, genre_ids: params[:genre_ids])

          if result.success?
            result result.game, serializer: GameSerializer
          else
            not_found
          end
        end
      end
    end
  end
end
