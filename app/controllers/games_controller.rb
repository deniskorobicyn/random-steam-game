class GamesController < ApplicationController
  def index
    @games = current_user.games.preload(:genres).order(:name)
  end

  def new
    @game = Game.new
  end

  def create
    if (context = Games::Save.call(game: current_user.games.build, params: games_params, current_user: current_user)).success?
      redirect_to games_url
    else
      @game = context.game
      render 'new'
    end
  end

  def edit
    @game = game
  end

  def update
    if (context = Games::Save.call(game: game, params: games_params, current_user: current_user)).success?
      redirect_to games_url
    else
      @game = context.game
      render 'update'
    end
  end

  def destroy
    game.destroy!

    redirect_to games_url
  end

  private

  def games_params
    params.require(:game).permit(:name)
  end

  def game
    @game ||= Game.find(params[:id])
  end

  def page
    params[:page] || 1
  end
end
