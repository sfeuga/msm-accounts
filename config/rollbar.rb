# frozen_string_literal: true

require 'rollbar'

rollbar_access_token = ENV['ROLLBAR_ACCESS_TOKEN']

if rollbar_access_token
  # production configuration
  Rollbar.configure do |config|
    config.enabled = true
    config.access_token = rollbar_access_token
    config.populate_empty_backtraces = true
    config.use_thread
  end
  warn 'Rollbar: using online service at https://rollbar.com/'
else
  # for dev, log to file
  Rollbar.configure do |config|
    config.enabled = false
  end
  warn 'Rollbar: disabled'
end
