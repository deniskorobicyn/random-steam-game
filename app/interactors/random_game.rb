class RandomGame
  include Interactor

  delegate :user, :params, to: :context
  def call
    scope = user.games
    scope = scope.joins(:game_genres).where(game_genres: {genre_id: params[:genre_ids]}) if params[:genre_ids].present?
    context.game = scope.order(:name).offset(rand(scope.count)).first

    context.fail! unless context.game
  end
end
