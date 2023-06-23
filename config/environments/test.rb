# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# rubocop:disable Metrics/BlockLength
Rails.application.configure do
  config.cache_classes = true
  config.eager_load = ENV['CI'].present?
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.active_storage.service = :cloudinary
  host = 'https://fierce-ravine-71442.herokuapp.com'
  config.action_mailer.default_url_options = { host: host }

  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    user_name: 'your@email',
    password: 'your@pass',
    authentication: 'plain',
    enable_starttls_auto: true
  }
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :test
  config.active_support.deprecation = :stderr
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
end
# rubocop:enable Metrics/BlockLength
