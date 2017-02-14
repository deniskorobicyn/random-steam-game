class RandomAchievement
  include Interactor

  delegate :game, :appid, to: :context
  def call
    schema = Steam::UserStats.game_schema(game&.steam_appid || appid)

    context.achievement = schema&.dig('availableGameStats', 'achievements')&.sample || {}
  end
end
