class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = current_user.games.preload(:genres).order(:name)
  end

  def new
    @game = Game.new
  end

  def create
    if (context = GameSaver.call(params: params, current_user: current_user)).success?
      redirect_to games_url
    else
      @game = context.game
      render 'new'
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    if (context = GameSaver.call(params: params, current_user: current_user)).success?
      redirect_to games_url
    else
      @game = context.game
      render 'update'
    end
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy!

    redirect_to games_url
  end

  private

  def page
    params[:page] || 1
  end
end
