module Api
  module V1
    class BaseController < ApplicationController
      before_action :doorkeeper_authorize!

      rescue_from ActionController::ParameterMissing, with: :bad_request

      rescue_from ActiveModel::RangeError, with: :bad_request
    
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
   
      def result(resource, opts = {})
        render(opts.merge(json: resource, status: :ok))
      end
    
      def created(resource, opts={}, location = nil)
        render(opts.merge(json: resource, status: :created, location: location))
      end
    
      def accepted(job_id, opts = {})
        render(opts.merge(json: {job_id: job_id}, status: :accepted))
      end
    
      def no_content(location = nil)
        head(:no_content, location: location)
      end
 
      def render_error(status, opts = {})
        render(opts.merge(status: status))
      end

      def current_user
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      %i(
        internal_server_error
        not_found
        method_not_allowed
        unauthorized
        forbidden
        conflict
        bad_request
      ).each do |method|
        define_method(method) do  |*args|
          render_error(method, *args)
        end
      end
    
      def unprocessable(errors)
        render_error(:unprocessable_entity, json: errors)
      end
    end
  end
end