class Api::RandomGameController < ApplicationController
  before_action :authenticate_user!

  def index
    service = RandomGame.call(user: current_user)
    render json: {name: service.game, img: service.img}
  end
end
