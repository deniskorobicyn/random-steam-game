module Api
  module V1
    module Games
      class SyncController < ApplicationController
        before_action :authenticate_user!

        def create
          job_id = ::Games::SyncSteamGamesWorker.perform_async(current_user.id)

          render json: {job_id: job_id}, status: 202
        end
      end
    end
  end
end
