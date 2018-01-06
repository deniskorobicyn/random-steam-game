module Api
  module V1
    class JobsController < Api::BaseController
      def show
        render json: Sidekiq::Status.get_all(params.require(:id)).as_json
      end
    end
  end
end
