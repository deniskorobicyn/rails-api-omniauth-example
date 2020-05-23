Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, Creds.get(:google, :client_id), Creds.get(:google, :client_secret)
end