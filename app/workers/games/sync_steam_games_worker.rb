module Games
  class SyncSteamGamesWorker
    include Sidekiq::Worker
    include Sidekiq::Status::Worker
    sidekiq_options retry: false

    def perform(user_id)
      user = User.find(user_id)
      service = ::Games::SyncSteamGamesService.new(user)
      total service.total
      succeed = errors = 0
      service.sync do |saved, game_or_index|
        at game_or_index
        if saved
          succeed += 1
        else
          errors += 1
        end
      end
      store succeed: succeed
      store errors: errors
    end
  end
end
