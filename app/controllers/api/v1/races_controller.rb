module Api
  module V1
    class RacesController < ApplicationController
      def index
        run Race::Index
        render json: @model
      end

      def create
        result = run Race::Create
        if result.success?
          render json: @model, status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Race::Show
        render json: @model
      end

      def update
        result = run Race::Update
        if result.success?
          render json: @model, status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Race::Delete
      end

      private

      def _run_options(options)
        options = super(options)
        options.merge('contract.default.class' => MyContainer['race.contract'])
      end
    end
  end
end
