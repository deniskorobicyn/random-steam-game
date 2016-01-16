class Api::Random::GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    service = RandomGame.call(user: current_user)
    render json: {
      appid: service.appid,
      name: service.game,
      img: service.img
    }
  end
end
