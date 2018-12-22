module Api
  module V1
    class CarsController < ApplicationController
      def index
        run Car::Index
        render json: @model
      end

      def create
        result = run Car::Create
        if result.success?
          render json: @model, status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Car::Show
        render json: @model
      end

      def update
        result = run Car::Update
        if result.success?
          render json: @model, status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Car::Delete
      end

      private

      def _run_options(options)
        options = super(options)
        options.merge('contract.default.class' => MyContainer['car.contract'])
      end
    end
  end
end
