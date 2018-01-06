class HomeController < ApplicationController
  def index
    @service = RandomizeGame.call(user: current_user, genre_ids: params[:genre_ids])
    @genres = Genre.all
  end
end
