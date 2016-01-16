class RandomAchievement
  include Interactor

  def call
    select_achievement
  end

  def select_achievement
    schema = Steam::UserStats.game_schema(context.appid)

    context.achievement = schema&.dig('availableGameStats', 'achievements')&.sample || {}
  end
end
