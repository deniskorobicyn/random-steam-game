module Api
  module V1
    module Random
      class GamesController < ApplicationController
        before_action :authenticate_user!

        def index
          game = RandomGame.call(user: current_user).game
          render json: {
            appid: game.steam_appid,
            name: game.name,
            img: game.full_image_url
          }
        end
      end
    end
  end
end
