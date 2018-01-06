module Api
  module V1
    module Random
      class AchievementsController < Api::BaseController
        def show
          service = ::Choosers::PickAchievement.call(appid: params.require(:steam_appid))

          if service.success?
            render json: { achievement: service.achievement }
          else
            not_found
          end
        end
      end
    end
  end
end
