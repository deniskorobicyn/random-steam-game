module Choosers
  class PickAchievement
    include Interactor

    delegate :appid, to: :context
    def call
      context.fail! unless appid

      schema = Steam::UserStats.game_schema(appid)

      context.achievement = schema&.dig('availableGameStats', 'achievements')&.sample || {}
    end
  end
end
