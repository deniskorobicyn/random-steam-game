Sidekiq.configure_server do |config|
  config.redis = { host: ENV['RSG_REDIS_HOST'], port: ENV['RSG_REDIS_PORT'] }

  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes
  end

  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes
  end
end

Sidekiq.configure_client do |config|
  config.redis = { host: ENV['RSG_REDIS_HOST'], port: ENV['RSG_REDIS_PORT'] }
end
