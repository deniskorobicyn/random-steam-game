class Api::Random::AchievementsController < ApplicationController
  before_action :authenticate_user!

  def index
    service = ::RandomAchievement.call(appid: params[:appid], user: current_user)
    render json: { achievement: service.achievement }
  end
end
