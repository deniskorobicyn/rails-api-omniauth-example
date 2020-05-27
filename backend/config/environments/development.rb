Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_controller.perform_caching = false

  config.cache_store = :null_store
end

Rails.application.routes.default_url_options = {
  host: ENV.fetch('DEV_HOST', 'localhost:3001')
}