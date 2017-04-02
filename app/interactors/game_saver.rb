class GameSaver
  include Interactor

  delegate :params, :current_user, to: :context

  def call
    Game.transaction do
      saved = game.update(params.require(:game).permit(:name))

      if saved
        ug = UserGame.find_or_initialize_by(game: game, user: current_user)
        context.fail! unless ug.save
      else
        context.fail!
      end
    end
  end

  private

  def game
    @game ||= params[:id].present? ? Game.find(params[:id]) : current_user.games.build
  end
end