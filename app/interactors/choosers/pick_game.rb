module Choosers
  class PickGame
    include Interactor

    delegate :user, :genre_ids, to: :context
    def call
      scope = user.games

      scope = scope.with_genres(genre_ids) if genre_ids.present?

      # TODO: think about more effective way to pick the game
      context.game = scope.order(:name).offset(rand(scope.count)).first

      context.fail! unless context.game

      # For PickAchievement
      context.appid = context.game.steam_appid
    end
  end
end
