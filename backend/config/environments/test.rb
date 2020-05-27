Rails.application.configure do
  config.cache_classes = false
  config.action_view.cache_template_loading = true
  config.eager_load = false
  config.public_file_server.enabled = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store
  config.action_controller.allow_forgery_protection = false
  config.active_support.deprecation = :stderr
end

Rails.application.routes.default_url_options = {
  host: ENV.fetch('DEV_HOST', 'localhost:3001')
}