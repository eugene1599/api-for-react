module Api
  module V1
    class CarsController < ApplicationController
      def index
        run Car::Index
        render json: CarSerializer.render(@model)
      end

      def create
        result = run Car::Create
        if result.success?
          render json: CarSerializer.render(@model), status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Car::Show
        render json: CarSerializer.render(@model)
      end

      def update
        result = run Car::Update
        if result.success?
          render json: CarSerializer.render(@model), status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Car::Destroy
      end
    end
  end
end
