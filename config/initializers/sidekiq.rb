# config/initializers/sidekiq.rb
require 'sidekiq'

Sidekiq.configure_server do |config|
    config.redis = { url: 'http://localhost:6379' }
  end
  
Sidekiq.configure_client do |config|
  config.redis = { url: 'http://localhost:6379' }
end