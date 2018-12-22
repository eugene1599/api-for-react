module Api
  module V1
    class CustomersController < ApplicationController
      def index
        run Customer::Index
        render json: @model
      end

      def create
        result = run Customer::Create
        if result.success?
          render json: @model, status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Customer::Show
        render json: @model
      end

      def update
        result = run Customer::Update
        if result.success?
          render json: @model, status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Customer::Delete
      end

      private

      def _run_options(options)
        options = super(options)
        options.merge('contract.default.class' => MyContainer['customer.contract'])
      end
    end
  end
end
