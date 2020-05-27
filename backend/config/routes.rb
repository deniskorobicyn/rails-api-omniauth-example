Rails.application.routes.draw do
  use_doorkeeper scope: 'api/v1/oauth' do
    controllers tokens: 'api/v1/auth/tokens'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'api/v1/auth/callback' }

  namespace :api do
    namespace :v1 do
      scope 'auth/:provider', module: :auth do
        resource :callback, only: :create
      end

      resource :secrets, only: :show
    end
  end
end
