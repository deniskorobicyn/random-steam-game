class RandomAchievement
  include Interactor

  def call
    schema = Steam::UserStats.game_schema(context.appid)

    context.achievement = schema&.dig('availableGameStats', 'achievements')&.sample || {}
  end
end
