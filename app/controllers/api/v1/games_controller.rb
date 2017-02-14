module Api
  module V1
    class GamesController < ApplicationController
      before_action :authenticate_user!

      def index
        # TODO
      end

      def create
        job_id = Games::SyncSteamGamesWorker.perform_async(current_user)

        render json: {job_id job_id}, status: 202
      end
    end
  end
end
