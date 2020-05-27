module Api
  module V1
    class SecretsController < BaseController
      def show
        result(secret: 'Visible only for authenticated user')
      end
    end
  end
end