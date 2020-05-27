module Authentication
  class Process
    include Interactor

    delegate :params, :request, to: :context
    def call
      user = User.find_by(email: email)

      unless user
        user = User.create!(email: email, password: Devise.friendly_token.first(10))
      end

      context.token = user.access_tokens.create!(
        expires_in: 1.hour,
        use_refresh_token: Doorkeeper.configuration.refresh_token_enabled?,
        scopes: ['email', *Doorkeeper.configuration.default_scopes].join(' ')
      ).plaintext_token
    end

    private

    def payload
      request.env['omniauth.auth']
    end

    def email
      payload.dig('info', 'email')
    end
  end
end