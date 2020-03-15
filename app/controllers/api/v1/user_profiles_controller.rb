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
    end
  end
end
