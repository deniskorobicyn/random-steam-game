module Games
  module Sync
    module Steam
      class GamesWorker
        include Sidekiq::Worker
        include Sidekiq::Status::Worker
        sidekiq_options retry: false

        def perform(user_id)
          user = User.find(user_id)

          total_proc = -> (size) do
            total size
          end

          succeed = errors = 0

          progress_proc = -> (saved, index) do
            at index

            if saved
              succeed += 1
            else
              errors += 1
            end
          end

          ::Games::Steam::SyncGames.call(
            current_user: user,
            progress_proc: progress_proc,
            total_proc: total_proc
          )

          store succeed: succeed
          store errors: errors
        end
      end
    end
  end
end
