class RandomGame
  include Interactor

  delegate :user, :params, to: :context
  def call
    scope = user.games

    if params[:genre_ids].present?
      scope = scope.joins(:game_genres).where(game_genres: {genre_id: params[:genre_ids]})
    end

    context.game = scope.order(:name).offset(rand(scope.count)).first

    context.fail! unless context.game
  end
end
