class HomeController < ApplicationController
  def index
    @service = Chooser.call(user: current_user, params: params)
    @genres = Genre.all
  end
end
