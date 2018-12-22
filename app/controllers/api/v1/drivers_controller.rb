module Api
  module V1
    class DriversController < ApplicationController
      def index
        run Driver::Index
        render json: @model
      end

      def create
        result = run Driver::Create
        if result.success?
          render json: @model, status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Driver::Show
        render json: @model
      end

      def update
        result = run Driver::Update
        if result.success?
          render json: @model, status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Driver::Delete
      end

      private

      def _run_options(options)
        options = super(options)
        options.merge('contract.default.class' => MyContainer['driver.contract'])
      end
    end
  end
end
