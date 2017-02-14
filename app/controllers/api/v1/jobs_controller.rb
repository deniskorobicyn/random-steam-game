module Api
  module V1
    class JobsController < ApplicationController
      before_action :authenticate_user!

      def show
        render json: Sidekiq::Status.get_all(params.fetch(:id)).as_json
      end
    end
  end
end
