Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = false
  config.log_level = :error
  config.log_tags = [ :request_id ]
  config.i18n.fallbacks = true

  config.active_support.deprecation = :silence

  config.log_formatter = ::Logger::Formatter.new
  logger = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger = ActiveSupport::TaggedLogging.new(logger)
  config.active_record.dump_schema_after_migration = false
end
