module Api
  module V1
    class DriversController < ApplicationController
      def index
        run Driver::Index
        render json: DriverSerializer.render(@model)
      end

      def create
        result = run Driver::Create
        if result.success?
          render json: DriverSerializer.render(@model), status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Driver::Show
        render json: DriverSerializer.render(@model)
      end

      def update
        result = run Driver::Update
        if result.success?
          render json: DriverSerializer.render(@model), status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Driver::Destroy
      end
    end
  end
end
