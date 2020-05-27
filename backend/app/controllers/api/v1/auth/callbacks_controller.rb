module Api
  module V1
    module Auth
      class CallbacksController < Api::V1::BaseController
        skip_before_action :doorkeeper_authorize!

        def create
          context = Authentication::Process.call(params: params, request: request)

          if context.success?
            result(token: context.token)
          else
            bad_request
          end
        end
      end
    end
  end
end
