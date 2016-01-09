class HomeController < ApplicationController
  def index
    @service = RandomGame.call(user: current_user) if current_user
  end
end
