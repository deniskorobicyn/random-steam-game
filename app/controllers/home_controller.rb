class HomeController < ApplicationController
  def index
    @service = Chooser.call(user: current_user)
  end
end
