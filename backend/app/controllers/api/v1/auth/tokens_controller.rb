module Api
  module V1
    module Auth
      class TokensController < ::Doorkeeper::TokensController
        def create
          super
        end
      end
    end
  end
end
