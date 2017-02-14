class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = GamesFinder.call(user: current_user, page: page)
  end

  private

  def page
    params[:page] || 1
  end
end
