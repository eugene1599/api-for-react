module Api
  module V1
    class UserProfilesController < ApplicationController
      def show
        result = run UserProfile::Show
        render json: @model
      end

      def update
        result = run UserProfile::Update
        if result.success?
          render json: @model, status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      private

      def _run_options(options)
        options = super(options)
        options.merge('contract.default.class' => MyContainer['user_profile.contract'])
      end
    end
  end
end
